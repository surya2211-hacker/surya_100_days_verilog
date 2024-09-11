`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2024 22:20:45
// Design Name: 
// Module Name: four_bit_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module FourBitParallelAdder (
    input  [3:0] A,      // 4-bit input A
    input  [3:0] B,      // 4-bit input B
    input        Cin,    // Carry-in input
    output [3:0] Sum,    // 4-bit sum output
    output       Cout    // Carry-out output
);

    // Internal wires for carry between stages
    wire C1, C2, C3;

    // 1-bit full adders for each bit
    four_bit_adder FA0 (
        .A(A[0]),
        .B(B[0]),
        .CIN(Cin),
        .SUM(Sum[0]),
        .COUT(C1)
    );

    four_bit_adder FA1 (
        .A(A[1]),
        .B(B[1]),
        .CIN(C1),
        .SUM(Sum[1]),
        .COUT(C2)
    );

    four_bit_adder FA2 (
        .A(A[2]),
        .B(B[2]),
        .CIN(C2),
        .SUM(Sum[2]),
        .COUT(C3)
    );

    four_bit_adder FA3 (
        .A(A[3]),
        .B(B[3]),
        .CIN(C3),
        .SUM(Sum[3]),
        .COUT(Cout)
    );

endmodule

module four_bit_adder(
    input A,
    input B,
    input CIN,
    output SUM,
    output COUT
    );
    // Sum calculation
    assign SUM = A ^ B ^ CIN;

    // Carry-out calculation
    assign COUT = (A & B) | (CIN & (A ^ B));
   

endmodule
