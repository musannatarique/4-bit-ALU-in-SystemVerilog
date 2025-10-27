/////// Testbench for ALU_4bit ////////
`timescale 1ns/1ps

module RTL_ALU_TB;

    // Inputs
    logic [3:0] A, B;
    logic [3:0] ALU_CONT;
    logic en;

    // Outputs
    logic [3:0] ALU_OUT;
    logic Zero, Pos, Neg;
    logic GT, LT, EQ, GTS, LTS;

    // Instantiate the ALU (module name must match the RTL file)
    RTL_ALU dut (
        .A(A),
        .B(B),
        .ALU_CONT(ALU_CONT),
        .en(en),
        .ALU_OUT(ALU_OUT),
        .Zero(Zero),
        .Pos(Pos),
        .Neg(Neg),
        .GT(GT),
        .LT(LT),
        .EQ(EQ),
        .GTS(GTS),
        .LTS(LTS)
    );

    // Data generator: keeps changing A and B every 50 ns
    time DATA_PERIOD = 50ns;
    initial begin
        A = 2; 
        B = 5;
        forever begin
            #DATA_PERIOD;
            A = $urandom_range(1, 15);
            B = $urandom_range(1, 15);
        end
    end

    // Main stimulus process
    initial begin
        en = 1; // Enable ALU
        $display("Time\tALU_CONT\tA\tB\tALU_OUT\tZ P N\tGT LT EQ\tGTS LTS");
        $display("---------------------------------------------------------------------");

        // Loop through all 16 ALU operations
        for (int i = 0; i < 16; i++) begin
            ALU_CONT = i;
            #10; // Wait 10 ns between operations
            $display("%0t\t%04b\t\t%b\t%b\t%b\t%b %b %b\t%b %b %b\t%b %b", 
                     $time, ALU_CONT, A, B, ALU_OUT, Zero, Pos, Neg, GT, LT, EQ, GTS, LTS);
        end

        // Disable ALU test
        en = 0;
        #10;
        $display("ALU disabled: ALU_OUT = %b, Zero = %b, Pos = %b, Neg = %b", ALU_OUT, Zero, Pos, Neg);
        $finish;
    end

endmodule
