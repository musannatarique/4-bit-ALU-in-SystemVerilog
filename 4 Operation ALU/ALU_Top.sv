`timescale 1ns/1ps

module alu_top (
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic [1:0] ALU_CONT,
    output logic [3:0] ALU_OUT
);

    // Wires for demux outputs
    logic [3:0] A_add, A_sub, A_and, A_or;
    logic [3:0] B_add, B_sub, B_and, B_or;

    // Wires for operation outputs
    logic [3:0] sum_out, sub_out, and_out, or_out;

    // Two 1-to-4 demuxes for A and B
    demux_1to4 demuxA (.in(A), .sel(ALU_CONT), .out0(A_add), .out1(A_sub), .out2(A_and), .out3(A_or));
    demux_1to4 demuxB (.in(B), .sel(ALU_CONT), .out0(B_add), .out1(B_sub), .out2(B_and), .out3(B_or));

    // Instantiate functional blocks
    adder_4bit       u_add (.a_in(A_add), .b_in(B_add), .sum_out(sum_out));
    subtractor_4bit  u_sub (.a_in(A_sub), .b_in(B_sub), .sub_out(sub_out));
    and_4bit         u_and (.a_in(A_and), .b_in(B_and), .and_out(and_out));
    or_4bit          u_or  (.a_in(A_or),  .b_in(B_or),  .or_out(or_out));

    // 4-to-1 multiplexer for final output
    always_comb begin
        case (ALU_CONT)
            2'b00: ALU_OUT = sum_out;
            2'b01: ALU_OUT = sub_out;
            2'b10: ALU_OUT = and_out;
            2'b11: ALU_OUT = or_out;
            default: ALU_OUT = 4'b0000;
        endcase
    end

endmodule
