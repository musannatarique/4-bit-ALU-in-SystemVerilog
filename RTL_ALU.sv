// 4-bit 16-operation ALU with Status Flags
`timescale 1ns/1ps

module RTL_ALU (
    input  logic [3:0] A, B,
    input  logic [3:0] ALU_CONT,
    input  logic  en, // Enable pin
    output logic [3:0] ALU_OUT,
    output logic Zero, Pos, Neg,
    output logic GT, LT, EQ, GTS, LTS
);

    logic [3:0] result;

    // ALU Main Operation
    always_comb begin
        if (en) begin
        unique case (ALU_CONT)
                4'b0000: result = A + B;               // Add
                4'b0001: result = A - B;               // Subtract
                4'b0010: result = A + 1;               // Increment A
                4'b0011: result = A - 1;               // Decrement A
                4'b0100: result = A << 1;              // Shift Left
                4'b0101: result = A >> 1;              // Shift Right
                4'b0110: result = (A << 1) | (A >> 3); // Rotate Left By-1 (A << n) | (A >> (WIDTH - n))
                4'b0111: result = (A >> 1) | (A << 3); // Rotate Right By-1 (A >> n) | (A << (WIDTH - n))
                4'b1000: result = ~A;                  // NOT A
                4'b1001: result = ~B;                  // NOT B
                4'b1010: result = A & B;               // AND
                4'b1011: result = A | B;               // OR
                4'b1100: result = ~(A & B);            // NAND
                4'b1101: result = ~(A | B);            // NOR
                4'b1110: result = A ^ B;               // XOR
                4'b1111: result = ~(A ^ B);            // XNOR
                default: result = 4'b0000;
            endcase
        end 
        else begin
            result = '0;   
        end
    end
    // Connect internal result to output port
    assign ALU_OUT = result;

    // Status Flags

    always_comb begin
        if (en) begin
            Zero = (result == '0);
            Pos  = (~result[3] && (result != '0)); // High if MSB=0 and not zero
            Neg  = result[3]; // High if MSB=1

            // Unsigned comparisons
            GT = (A > B);
            LT = (A < B);
            EQ = (A == B);

            // Signed comparisons
            GTS = ($signed(A) > $signed(B));
            LTS = ($signed(A) < $signed(B));
        end 
        else begin
            Zero = '0; Pos = '0; Neg = '0;
            GT = '0; LT = '0; EQ = '0; GTS = '0; LTS = '0;
        end
    end

endmodule