`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2024 22:40:45
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input a, b, cin,  // Inputs
    output sum, cout  // Outputs
    );
    
    wire w1, w2, w3;  // Internal wires
    
    // XOR gates to calculate intermediate and final sum
    xor x1(w1, a, b);     // w1 = a XOR b
    xor x2(sum, w1, cin); // sum = w1 XOR cin
    
    // AND gates to calculate intermediate carry
    and a1(w2, w1, cin);  // w2 = w1 AND cin
    and a2(w3, a, b);     // w3 = a AND b
    
    // OR gate to calculate final carry-out
    or o1(cout, w2, w3);  // cout = w2 OR w3
    
endmodule


