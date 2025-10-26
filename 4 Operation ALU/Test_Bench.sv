////// Testbench for 1-to-4 Demux ////////
`timescale 1ns/1ps

module tb_demux_1to4;

    // Inputs
    logic [3:0] in;
    logic [1:0] sel;

    // Outputs
    logic [3:0] out0, out1, out2, out3;

    // Instantiate the Demux
    demux_1to4 dut (
        .in(in),
        .sel(sel),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3)
    );

    // Random data generator
    time DATA_PERIOD = 50ns;
    initial begin
        in = 4'b1010;
        forever begin
            #DATA_PERIOD;
            in = $urandom_range(0, 15);
            sel = $urandom_range(0, 3);
        end
    end

    // Main stimulus
    initial begin
        $display("Time\tSEL\tIN\tOUT0 OUT1 OUT2 OUT3");
        $display("-------------------------------------------");

        for (int i = 0; i < 8; i++) begin
            #10;
            $display("%0t\t%b\t%b\t%b %b %b %b", $time, sel, in, out0, out1, out2, out3);
        end

        $finish;
    end

endmodule


////// Testbench for 4-bit Adder ////////
`timescale 1ns/1ps

module tb_adder_4bit;

    // Inputs
    logic [3:0] a_in, b_in;

    // Output
    logic [3:0] sum_out;

    // Instantiate the adder
    adder_4bit dut (
        .a_in(a_in),
        .b_in(b_in),
        .sum_out(sum_out)
    );

    // Random data generator
    time DATA_PERIOD = 50ns;
    initial begin
        a_in = 4'b0001; b_in = 4'b0010;
        forever begin
            #DATA_PERIOD;
            a_in = $urandom_range(0, 15);
            b_in = $urandom_range(0, 15);
        end
    end

    // Main stimulus
    initial begin
        $display("Time\tA\tB\tSUM");
        $display("-------------------------");

        for (int i = 0; i < 8; i++) begin
            #10;
            $display("%0t\t%b\t%b\t%b", $time, a_in, b_in, sum_out);
        end

        $finish;
    end

endmodule

////// Testbench for 4-bit Subtractor ////////
`timescale 1ns/1ps

module tb_subtractor_4bit;

    // Inputs
    logic [3:0] a_in, b_in;

    // Output
    logic [3:0] sub_out;

    // Instantiate the subtractor
    subtractor_4bit dut (
        .a_in(a_in),
        .b_in(b_in),
        .sub_out(sub_out)
    );

    // Random data generator
    time DATA_PERIOD = 50ns;
    initial begin
        a_in = 4'b0101; b_in = 4'b0011;
        forever begin
            #DATA_PERIOD;
            a_in = $urandom_range(0, 15);
            b_in = $urandom_range(0, 15);
        end
    end

    // Main stimulus
    initial begin
        $display("Time\tA\tB\tSUB");
        $display("-------------------------");

        for (int i = 0; i < 8; i++) begin
            #10;
            $display("%0t\t%b\t%b\t%b", $time, a_in, b_in, sub_out);
        end

        $finish;
    end

endmodule

////// Testbench for 4-bit AND ////////
`timescale 1ns/1ps

module tb_and_4bit;

    // Inputs
    logic [3:0] a_in, b_in;

    // Output
    logic [3:0] and_out;

    // Instantiate the AND module
    and_4bit dut (
        .a_in(a_in),
        .b_in(b_in),
        .and_out(and_out)
    );

    // Random data generator
    time DATA_PERIOD = 50ns;
    initial begin
        a_in = 4'b1100; b_in = 4'b1010;
        forever begin
            #DATA_PERIOD;
            a_in = $urandom_range(0, 15);
            b_in = $urandom_range(0, 15);
        end
    end

    // Main stimulus
    initial begin
        $display("Time\tA\tB\tAND");
        $display("-------------------------");

        for (int i = 0; i < 8; i++) begin
            #10;
            $display("%0t\t%b\t%b\t%b", $time, a_in, b_in, and_out);
        end

        $finish;
    end

endmodule


////// Testbench for 4-bit OR ////////
`timescale 1ns/1ps

module tb_or_4bit;

    // Inputs
    logic [3:0] a_in, b_in;

    // Output
    logic [3:0] or_out;

    // Instantiate the OR module
    or_4bit dut (
        .a_in(a_in),
        .b_in(b_in),
        .or_out(or_out)
    );

    // Random data generator
    time DATA_PERIOD = 50ns;
    initial begin
        a_in = 4'b1100; b_in = 4'b1010;
        forever begin
            #DATA_PERIOD;
            a_in = $urandom_range(0, 15);
            b_in = $urandom_range(0, 15);
        end
    end

    // Main stimulus
    initial begin
        $display("Time\tA\tB\tOR");
        $display("-------------------------");

        for (int i = 0; i < 8; i++) begin
            #10;
            $display("%0t\t%b\t%b\t%b", $time, a_in, b_in, or_out);
        end

        $finish;
    end

endmodule


////// Testbench for ALU Top Module ////////
`timescale 1ns/1ps

module tb_alu_top;

    // Inputs
    logic [3:0] A, B;
    logic [1:0] ALU_CONT;

    // Output
    logic [3:0] ALU_OUT;

    // Instantiate the ALU top module
    alu_top dut (
        .A(A),
        .B(B),
        .ALU_CONT(ALU_CONT),
        .ALU_OUT(ALU_OUT)
    );

   // Data generator: keeps changing A and B every 50 ns
    time DATA_PERIOD = 50ns;
    initial begin
        A = 4'b0101; 
        B = 4'b0011;
        forever begin
            #DATA_PERIOD;
            A = $urandom_range(1, 15);
            B = $urandom_range(1, 15);
        end
    end

    // Main stimulus
    initial begin
        $display("Time\tALU_CONT\tA\tB\tALU_OUT");
        $display("-------------------------------------------");

        // Loop through all 4 ALU operations
        for (int i = 0; i < 4; i++) begin
            ALU_CONT = i;
            #10; // Wait 10 ns between operations
            $display("%0t\t%02b\t\t%b\t%b\t%b", $time, ALU_CONT, A, B, ALU_OUT);
        end

        $finish;
    end

endmodule
