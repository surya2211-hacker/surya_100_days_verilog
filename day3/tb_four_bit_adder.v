`timescale 1ns / 1ps

module FourBitParallelAdder_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire [3:0] Sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    FourBitParallelAdder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Initialize and drive the inputs
    initial begin
        // Initialize Inputs
        A = 4'b0000;
        B = 4'b0000;
        Cin = 0;

        // Apply test vectors
        #10 A = 4'b0001; B = 4'b0001; Cin = 0; // 1 + 1 = 2
        #10 A = 4'b0101; B = 4'b0011; Cin = 0; // 5 + 3 = 8
        #10 A = 4'b1111; B = 4'b0001; Cin = 0; // 15 + 1 = 16
        #10 A = 4'b1111; B = 4'b1111; Cin = 0; // 15 + 15 = 30
        #10 A = 4'b1010; B = 4'b0101; Cin = 1; // 10 + 5 + 1 = 16
        #10 A = 4'b1100; B = 4'b0011; Cin = 1; // 12 + 3 + 1 = 16
        
        // Test edge case
        #10 A = 4'b0000; B = 4'b0000; Cin = 1; // 0 + 0 + 1 = 1

        // End simulation
        #10 $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time = %0t | A = %b | B = %b | Cin = %b | Sum = %b | Cout = %b",
                 $time, A, B, Cin, Sum, Cout);
    end

endmodule
