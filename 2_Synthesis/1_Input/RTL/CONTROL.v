//`include "/data/user/alps04/ORCA_14/1_syn/1_input/RTL/VERILOG/RISCTYPES.v"
module CONTROL (
  input clk,                      // CPU Clock
  input reset_n,                  // Reset to the cpu core
  input [31:0] Crnt_Instrn,       // Current instruction under execution; from Instruction Latch
  input [2:0] Current_State,            // Current state of the control unit
  input Neg_Flag, Carry_Flag, Zro_Flag,
  output  Latch_Instr, Rd_Oprnd_A, Rd_Oprnd_B, Latch_Flags, Latch_Result, Write_RegC,
  output  UseData_Imm_Or_RegB, UseData_Imm_Or_ALU,
  output  Reset_AluRegs,
  output  EndOfInstrn,              // Used to dump PSW and RegFile contents into files at end of every WRITE_BACK cycle
  output  PushEnbl, PopEnbl,
  output  OUT_VALID
);
   reg Latch_Instr, Rd_Oprnd_A, Rd_Oprnd_B, Latch_Flags, Latch_Result, Write_RegC = 0;
   reg UseData_Imm_Or_RegB, UseData_Imm_Or_ALU = 0;
   reg Reset_AluRegs = 0;
   reg EndOfInstrn = 0;              // Used to dump PSW and RegFile contents into files at end of every WRITE_BACK cycle
   reg PushEnbl, PopEnbl = 0;
   reg OUT_VALID = 0;
  // Signal declarations
  reg Data_Imm_Or_ALU, Data_Imm_Or_RegB;
  reg Take_Branch;


  // Variables for process
  //reg Neg, Carry, Zro, Jmp;
  reg Neg, Carry, Zro, Jmp;
  // Process 1
  always @(Crnt_Instrn, Neg_Flag, Carry_Flag, Zro_Flag)
  //reg Neg, Carry, Zro, Jmp;
  begin
    if (Crnt_Instrn[25] == 1'b1) begin
      Neg   <= ~Neg_Flag;
      Carry <= ~Carry_Flag;
      Zro   <= ~Zro_Flag;
      Jmp   <= 1'b0;
    end else begin
      Neg   <= Neg_Flag;
      Carry <= Carry_Flag;
      Zro   <= Zro_Flag;
      Jmp   <= 1'b1;
    end

    if (Crnt_Instrn[23:16] == 8'b00000000) begin
      Take_Branch <= Neg;
    end else if (Crnt_Instrn[23:16] == 8'b00000001) begin
      Take_Branch <= Zro;
    end else if (Crnt_Instrn[23:16] == 8'b00111111) begin
      Take_Branch <= Jmp;
    end else begin
      Take_Branch <= 1'b0;
    end
  end

  // Process 2
//  always @(posedge clk or negedge reset_n)
//  begin
//    if (~reset_n) begin
//      Data_Imm_Or_RegB <= 2'b00;
//      Data_Imm_Or_ALU  <= 2'b00;
//    end else begin
//      Data_Imm_Or_RegB <= UseData_Imm_Or_RegB;
//      Data_Imm_Or_ALU  <= UseData_Imm_Or_ALU;
//    end
//  end

  always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n) begin
      UseData_Imm_Or_RegB <= 1'b0;
      UseData_Imm_Or_ALU  <= 1'b0;
    end else begin
      UseData_Imm_Or_RegB <= Data_Imm_Or_RegB;
      UseData_Imm_Or_ALU  <= Data_Imm_Or_ALU;
    end
  end

  // Process 3
  always @(Current_State, Crnt_Instrn, Take_Branch)
  begin
    OUT_VALID <= 1'b0;
    case (Current_State)

      // RESET_STATE
      3'b000: begin
        PushEnbl         <= 1'b0;
        PopEnbl          <= 1'b0;
        Latch_Flags      <= 1'b0;
        Latch_Result     <= 1'b0;
        Rd_Oprnd_A       <= 1'b0;
        Rd_Oprnd_B       <= 1'b0;
        Data_Imm_Or_RegB <= 1'b0;
        Data_Imm_Or_ALU  <= 1'b0;
        Latch_Instr      <= 1'b0;
        Reset_AluRegs    <= 1'b0;
        Write_RegC       <= 1'b0;
      end

      // FETCH_INSTR
      3'b001: begin
        Data_Imm_Or_RegB <= 1'b0;
        Data_Imm_Or_ALU  <= 1'b0;
        Latch_Instr      <= 1'b1;
        Reset_AluRegs    <= 1'b1;
        Write_RegC       <= 1'b0;
        PushEnbl         <= 1'b0;
        PopEnbl          <= 1'b0;
        Latch_Flags      <= 1'b0;
        Latch_Result     <= 1'b0;
        Rd_Oprnd_A       <= 1'b0;
        Rd_Oprnd_B       <= 1'b0;
      end

      // READ_OPS
      3'b010: begin
        Latch_Instr   <= 1'b0;
        Reset_AluRegs <= 1'b0;
        PushEnbl      <= 1'b0;
        PopEnbl       <= 1'b0;
        Latch_Flags   <= 1'b0;
        Latch_Result  <= 1'b0;
        Write_RegC    <= 1'b0;

        // Generation of mux selects for data path and operand read signals
        // Asserting them in this state gives sufficient time for setup

        case (Crnt_Instrn[31:30])
          2'b00: begin // (Type 0 instruction)
            // These 2 can actually be don't cares for Type 0
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b0;
            Rd_Oprnd_A       <= 1'b0;
            Rd_Oprnd_B       <= 1'b0;
          end

          2'b01: begin // (Type 1 instruction)
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b0;
            Rd_Oprnd_A       <= 1'b1;
            Rd_Oprnd_B       <= 1'b1;
          end

          2'b10: begin // (Type 2 instruction)
            Data_Imm_Or_RegB <= 1'b1;
            Data_Imm_Or_ALU  <= 1'b0;
            Rd_Oprnd_A       <= 1'b1;
            Rd_Oprnd_B       <= 1'b1;
          end

          2'b11: begin // (Type 3 instruction)
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b1;
            Rd_Oprnd_A       <= 1'b0;
            Rd_Oprnd_B       <= 1'b1;
          end

          default: begin
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b0;
            Rd_Oprnd_A       <= 1'b0;
            Rd_Oprnd_B       <= 1'b0;
          end
        endcase

        // Added by Anupam For reading the REG_FILE address given in the instruction on user request
        if (Crnt_Instrn[31:30] == 2'b00 && Crnt_Instrn[24] == 1'b1)
        begin
          Rd_Oprnd_A <= 1'b1;
        end
      end

      // EXECUTE
      3'b011: begin
        Rd_Oprnd_A    <= 1'b0;
        Rd_Oprnd_B    <= 1'b0;
        Latch_Instr   <= 1'b0;
        Reset_AluRegs <= 1'b0;
        Write_RegC    <= 1'b0;

        case (Crnt_Instrn[31:30])
          2'b00: begin // (Type 0 instruction)
            // These 2 can actually be don't cares for Type 0
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b0;
          end

          2'b01: begin // (Type 1 instruction)
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b0;
          end

          2'b10: begin // (Type 2 instruction)
            Data_Imm_Or_RegB <= 1'b1;
            Data_Imm_Or_ALU  <= 1'b0;
          end

          2'b11: begin // (Type 3 instruction)
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b1;
          end

          default: begin
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b0;
          end
        endcase

        if (Crnt_Instrn[31:30] == 2'b00 && Crnt_Instrn[24] == 1'b1)
          OUT_VALID <= 1'b1;
        else
          OUT_VALID <= 1'b0;
        //end
          
        // Push PC into Stack (Call Conditional)
        if ((Crnt_Instrn[31:30] == 2'b00 && Crnt_Instrn[28] == 1'b1) && Take_Branch == 1'b1)
          PushEnbl <= 1'b1;
        else
          PushEnbl <= 1'b0;
        //end

        // Pop from Stack (Return)
        if (Crnt_Instrn[31:30] == 2'b00 && Crnt_Instrn[27] == 1'b1)
          PopEnbl <= 1'b1;
        else
          PopEnbl <= 1'b0;
        //end

        // Latching flags for ALU ops but not pass-thru ( ?? Can this be same as Latch_Result ??)
        if (Crnt_Instrn[31:30] == 2'b01 || Crnt_Instrn[31:30] == 2'b10)
          Latch_Flags <= 1'b1;
        else
          Latch_Flags <= 1'b0;
        //end

        // Latching result for ALU and pass-thru
        if (Crnt_Instrn[31:30] == 2'b01 || Crnt_Instrn[31:30] == 2'b10 || Crnt_Instrn[31:30] == 2'b11)
          Latch_Result <= 1'b1;
        else
          Latch_Result <= 1'b0;
        //end
      end

      // WRITEBACK
      3'b100: begin
        Latch_Flags   <= 1'b0;
        Latch_Result  <= 1'b0;
        PushEnbl      <= 1'b0;
        PopEnbl       <= 1'b0;
        Rd_Oprnd_A    <= 1'b0;
        Rd_Oprnd_B    <= 1'b0;
        Latch_Instr   <= 1'b0;
        Reset_AluRegs <= 1'b0;

        // Write result of ALU OP or the immediate data to reg_file
        if (Crnt_Instrn[31:30] != 2'b00)
	begin
          Write_RegC <= 1'b1;
	end
        else
	begin
          Write_RegC <= 1'b0;
        end

        case (Crnt_Instrn[31:30])
          2'b00: begin // (Type 0 instruction)
            // These 2 can actually be don't cares for Type 0
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b0;
          end

          2'b01: begin // (Type 1 instruction)
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b0;
          end

          2'b10: begin // (Type 2 instruction)
            Data_Imm_Or_RegB <= 1'b1;
            Data_Imm_Or_ALU  <= 1'b0;
          end

          2'b11: begin // (Type 3 instruction)
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b1;
          end

          default: begin
            Data_Imm_Or_RegB <= 1'b0;
            Data_Imm_Or_ALU  <= 1'b0;
          end
        endcase
      end

      // Other states
      default: begin
        // Do nothing
      end
    endcase
  end

  // Additional process for endOfInstrn
  always @(posedge clk)
  begin
    if (Current_State == 3'b100) // WRITEBACK state
      EndOfInstrn <= 1'b1;
    else
      EndOfInstrn <= 1'b0;
    //end
  end

endmodule
