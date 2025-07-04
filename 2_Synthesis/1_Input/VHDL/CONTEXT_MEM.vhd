LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;

ENTITY CONTEXT_MEM IS
  PORT (
    sys_clk          : IN  std_logic;
    sys_rst_n        : IN  std_logic;
    
    context_en       : IN  std_logic;
    cmd              : IN  std_logic_vector(7 DOWNTO 0);

    pci_data_in      : IN  std_logic_vector(31 DOWNTO 0);
    pci_context_data : OUT std_logic_vector(31 DOWNTO 0)

  );
END CONTEXT_MEM;

ARCHITECTURE RTL OF CONTEXT_MEM IS

  COMPONENT ram32x64
    PORT (A1   : in  std_logic_vector(5 downto 0);
          A2   : in  std_logic_vector(5 downto 0);
          CE1  : in std_logic;
          CE2  : in std_logic;
          WEB1 : in std_logic;
          WEB2 : in std_logic;
          OEB1 : in std_logic;
          OEB2 : in std_logic;
          CSB1 : in std_logic;
          CSB2 : in std_logic;
          IO1  : inout  std_logic_vector(31 downto 0);
          IO2  : inout  std_logic_vector(31 downto 0)
         );
  END COMPONENT;

  SIGNAL ti_hi, ti_low  : std_logic;

  SIGNAL pci_data_in_buf : std_logic_vector(31 DOWNTO 0);
  SIGNAL context_data_0 : std_logic_vector(31 DOWNTO 0);
  SIGNAL context_data_1 : std_logic_vector(31 DOWNTO 0);
  SIGNAL context_data_2 : std_logic_vector(31 DOWNTO 0);
  SIGNAL context_data_3 : std_logic_vector(31 DOWNTO 0);
  SIGNAL ram_write_addr : std_logic_vector(5 DOWNTO 0);
  SIGNAL ram_read_addr  : std_logic_vector(5 DOWNTO 0);
  SIGNAL read_op        : std_logic_vector(2 DOWNTO 0);
  SIGNAL write_op       : std_logic_vector(3 DOWNTO 0);
  SIGNAL ram_write_cs   : std_logic_vector(3 DOWNTO 0);
  SIGNAL we_n           : std_logic;

BEGIN

  ti_hi <= '1';
  ti_low <= '0';
  
  read_op <= cmd(2 DOWNTO 0);
  write_op <= cmd(6 DOWNTO 3);
  we_n <= cmd(7);
  pci_data_in_buf <= pci_data_in;
  
  read_addr_gen : PROCESS ( sys_rst_n, sys_clk, context_en, read_op, ram_read_addr )
  BEGIN
    IF sys_rst_n='0' THEN
      ram_read_addr <= "000000";
    ELSIF sys_clk'event AND sys_clk='1' THEN
      IF context_en='1' AND read_op(2)='1' THEN
        ram_read_addr <= ram_read_addr + 1;
      ELSIF context_en='1' AND read_op(2)='0' THEN
        ram_read_addr <= ram_read_addr + 1;
      ELSE
        ram_read_addr <= ram_read_addr;
      END IF;
    END IF;
  END PROCESS;

  ram_chip_sel_decode: PROCESS ( write_op )
  BEGIN
    CASE write_op(1 DOWNTO 0) IS
      WHEN "00"   => ram_write_cs <= "1000";
      WHEN "01"   => ram_write_cs <= "0100";
      WHEN "10"   => ram_write_cs <= "0010";
      WHEN OTHERS => ram_write_cs <= "0001";
    END CASE;
  END PROCESS;

  write_addr_gen : PROCESS ( sys_rst_n, sys_clk, context_en, write_op, ram_write_addr )
  BEGIN
    IF sys_rst_n='0' THEN 
      ram_write_addr <= "000000";
    ELSIF sys_clk'event AND sys_clk='1' THEN
      IF write_op(3)='0' THEN
        ram_write_addr <= "000000";
      ELSIF context_en='1' AND write_op(2)='1' THEN
        ram_write_addr <= ram_write_addr + 1;
      ELSIF context_en='1' AND write_op(2)='0' THEN
        ram_write_addr <= ram_write_addr + 1;
      ELSE
        ram_write_addr <= ram_write_addr;
      END IF;
    END IF;
  END PROCESS;

  -- This is not needed if the bus works in tristate mode!!
  pci_context_selector : PROCESS(pci_data_in, context_en, read_op,
                                 context_data_0,
                                 context_data_1,
                                 context_data_2,
                                 context_data_3
                                 )
    
    VARIABLE sel : std_logic_vector(2 DOWNTO 0);
    
  BEGIN

    sel := context_en & read_op(1 DOWNTO 0);
    CASE sel IS
        WHEN "100" =>
          pci_context_data <= context_data_0;
        WHEN "101" =>
          pci_context_data <= context_data_1;
        WHEN "110" =>
          pci_context_data <= context_data_2;
        WHEN "111" =>
          pci_context_data <= context_data_3;
        WHEN OTHERS =>                  -- includes "0xx"
          pci_context_data <= pci_data_in;
    END CASE;
  END PROCESS;


  CONTEXT_RAM_0 : ram32x64
    PORT MAP (
      A1   => ram_write_addr,
      CE1  => sys_clk,
      WEB1 => we_n,
      OEB1 => ti_hi,
      CSB1 => ram_write_cs(0),
      IO1  => pci_data_in_buf,
      
      A2   => ram_read_addr,
      CE2  => sys_clk,
      WEB2 => ti_hi,
      OEB2 => ti_low,
      CSB2 => ti_low,
      IO2  => context_data_0
    );

  CONTEXT_RAM_1 : ram32x64
    PORT MAP (
      A1   => ram_write_addr,
      CE1  => sys_clk,
      WEB1 => we_n,
      OEB1 => ti_hi,
      CSB1 => ram_write_cs(1),
      IO1  => pci_data_in_buf,
      
      A2   => ram_read_addr,
      CE2  => sys_clk,
      WEB2 => ti_hi,
      OEB2 => ti_low,
      CSB2 => ti_low,
      IO2  => context_data_1
    );

  CONTEXT_RAM_2 : ram32x64
    PORT MAP (
      A1   => ram_write_addr,
      CE1  => sys_clk,
      WEB1 => we_n,
      OEB1 => ti_hi,
      CSB1 => ram_write_cs(2),
      IO1  => pci_data_in_buf,
      
      A2   => ram_read_addr,
      CE2  => sys_clk,
      WEB2 => ti_hi,
      OEB2 => ti_low,
      CSB2 => ti_low,
      IO2  => context_data_2
    );

  CONTEXT_RAM_3 : ram32x64
    PORT MAP (
      A1   => ram_write_addr,
      CE1  => sys_clk,
      WEB1 => we_n,
      OEB1 => ti_hi,
      CSB1 => ram_write_cs(3),
      IO1  => pci_data_in_buf,
      
      A2   => ram_read_addr,
      CE2  => sys_clk,
      WEB2 => ti_hi,
      OEB2 => ti_low,
      CSB2 => ti_low,
      IO2  => context_data_3
    );


      
END RTL;
