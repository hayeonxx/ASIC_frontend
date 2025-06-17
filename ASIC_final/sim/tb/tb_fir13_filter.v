`timescale 1ns / 1ps
`define T_CLK 10

module tb_fir13_filter;

    reg clk;
    reg n_rst;
    wire signed [7:0] xn;
    wire signed [7:0] yn;

    reg signed [7:0] xn_mem [0:2999];  // 입력 데이터 메모리
    reg [12:0] r_addr;  // 주소 카운터
    integer i;

    integer y_file;  // 출력 파일 포인터

    fir13_filter u_fir13_filter (
        .clk(clk),
        .n_rst(n_rst),
        .x_in(xn),
        .y_out(yn)
    );

    assign xn = $signed(xn_mem[r_addr]);

    // 클록 생성
    always #(`T_CLK/2) clk = ~clk;

    // 초기화 및 입력 데이터 로딩
    initial begin
        $readmemh("../tb/xn_data.txt", xn_mem);
        clk = 0;
        n_rst = 0;
        r_addr = 0;

        y_file = $fopen("../tb/yn_rdata.txt", "w");  // 출력 파일 열기

        #100;
        n_rst = 1;
    end

    // 입력 공급 및 주소 증가
    initial begin
        wait(n_rst == 1);
        for (i = 0; i < 3000; i = i + 1) begin
            #(`T_CLK);
            r_addr = r_addr + 1;
        end
        #100;
        $fclose(y_file);  // 출력 파일 닫기
        $finish;
    end

    // 출력 저장
    always @(posedge clk) begin
        if (n_rst)
            $fwrite(y_file, "%d\n", yn);
    end

    // initial begin
    //     $fsdbDumpfile("top.fsdb");
    //     $fsdbDumpvars(0, tb_fir13_filter);
    // end


    `ifdef SDF_PRE
    initial begin
        $sdf_annotate("../../syn/out/mapped/fir13_filter.pre.sdf", u_fir13_filter);
    end
    `endif 

    initial begin
        `ifdef SDF_PRE
            $fsdbDumpfile("test.pre.fsdb");
        `else
            $fsdbDumpfile("test.fsdb");
        `endif
        $fsdbDumpvars(0);
    end
endmodule
