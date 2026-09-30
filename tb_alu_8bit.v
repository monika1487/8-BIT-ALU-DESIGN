`timescale 1ns / 1ps

module tb_alu_8bit;

    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] Opcode;

    wire [7:0] Y;
    wire Z, C, V, N;

    // Instantiate your ALU Module
    alu_8bit uut (
        .A(A),
        .B(B),
        .Opcode(Opcode),
        .Y(Y),
        .Z(Z),
        .C(C),
        .V(V),
        .N(N)
    );

    initial begin
        // Setup waveform dumping for EPWave viewer
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_alu_8bit);

        $display("\n=================== RUNNING ALU TESTS ===================");

        // Test 1: Signed Overflow (127 + 1 = -128)
        A = 8'd127; B = 8'd1; Opcode = 4'b0000; #10;
        $display("ADD (127 + 1) | Y = %d | Flags: Z=%b C=%b V=%b N=%b", $signed(Y), Z, C, V, N);

        // Test 2: Subtraction to Zero (45 - 45 = 0)
        A = 8'd45; B = 8'd45; Opcode = 4'b0001; #10;
        $display("SUB (45 - 45) | Y = %d   | Flags: Z=%b C=%b V=%b N=%b", $signed(Y), Z, C, V, N);

        // Test 3: Bitwise AND
        A = 8'b1010_1010; B = 8'b1100_1100; Opcode = 4'b0010; #10;
        $display("AND Logic     | Y = %b | Flags: Z=%b C=%b V=%b N=%b", Y, Z, C, V, N);

        $display("=================== TESTS COMPLETE ===================\n");
        $finish;
    end

endmodule