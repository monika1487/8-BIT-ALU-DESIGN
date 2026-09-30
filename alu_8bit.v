// 8-Bit ALU Module with Status Flags
module alu_8bit (
    input  wire [7:0] A,        // Operand A
    input  wire [7:0] B,        // Operand B
    input  wire [3:0] Opcode,   // 4-bit Opcode Select
    output reg  [7:0] Y,        // 8-bit Result Output
    output reg        Z,        // Zero Flag
    output reg        C,        // Carry Flag
    output reg        V,        // Signed Overflow Flag
    output reg        N         // Negative Flag
);

    reg [8:0] sum_ext; // 9-bit extended register for carry/borrow detection

    always @(*) begin
        // Default values
        sum_ext = 9'b0;
        Y       = 8'b0;
        C       = 1'b0;
        V       = 1'b0;

        case (Opcode)
            4'b0000: begin // ADD Operation
                sum_ext = {1'b0, A} + {1'b0, B};
                Y       = sum_ext[7:0];
                C       = sum_ext[8]; // Carry out
                // Signed Overflow: V = (~(A7 ^ B7)) & (A7 ^ Y7)
                V       = (~(A[7] ^ B[7])) & (A[7] ^ Y[7]);
            end

            4'b0001: begin // SUB Operation
                sum_ext = {1'b0, A} - {1'b0, B};
                Y       = sum_ext[7:0];
                C       = sum_ext[8]; // Borrow out
                // Signed Overflow for subtraction
                V       = (A[7] ^ B[7]) & (A[7] ^ Y[7]);
            end

            4'b0010: Y = A & B;        // Bitwise AND
            4'b0011: Y = A | B;        // Bitwise OR
            4'b0100: Y = A ^ B;        // Bitwise XOR
            4'b0101: Y = ~A;           // Bitwise NOT
            4'b0110: Y = A << B[2:0];  // Shift Left Logical (SLL)
            4'b0111: Y = A >> B[2:0];  // Shift Right Logical (SLR)

            default: Y = 8'b00000000;
        endcase

        // Status Flags
        Z = (Y == 8'b00000000) ? 1'b1 : 1'b0; // Zero Flag
        N = Y[7];                             // Negative Flag (MSB)
    end

endmodule