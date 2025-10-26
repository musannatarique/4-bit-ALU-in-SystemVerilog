`timescale 1ns/1ps
 
// 1-to-4 Demultiplexer for 4-bit input
module demux_1to4 (
    input  logic [3:0] in,
    input  logic [1:0] sel,
    output logic [3:0] out0,
    output logic [3:0] out1,
    output logic [3:0] out2,
    output logic [3:0] out3
);
    always_comb begin
        // Default all outputs to zero
        out0 = '0;
        out1 = '0;
        out2 = '0;
        out3 = '0;
        
        case (sel)
            2'b00: out0 = in;  // Route to ADD
            2'b01: out1 = in;  // Route to SUB
            2'b10: out2 = in;  // Route to AND
            2'b11: out3 = in;  // Route to OR
        endcase
    end
endmodule

// 4-bit Adder Module //
module adder_4bit (
    input  logic [3:0] a_in,
    input  logic [3:0] b_in,
    output logic [3:0] sum_out
);
    // Addition 
    assign sum_out = a_in + b_in;
endmodule

// 4-bit Subtractor Module //
module subtractor_4bit (
    input  logic [3:0] a_in,
    input  logic [3:0] b_in,
    output logic [3:0] sub_out_out
);
    // Subtraction 
    assign sub_out = a_in - b_in;
endmodule

// 4-bit AND Module //
module and_4bit (
    input  logic [3:0] a_in,
    input  logic [3:0] b_in,
    output logic [3:0] and_out
);
    // Bit-wise AND 
    assign and_out = a_in & b_in;
endmodule

// 4-bit OR Module //
module or_4bit (
    input  logic [3:0] a_in,
    input  logic [3:0] b_in,
    output logic [3:0] or_out
);
    // Bit-wise OR 
    assign or_out = a_in | b_in;
endmodule

