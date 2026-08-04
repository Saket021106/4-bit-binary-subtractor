`timescale 1ns / 1ps

module tb_subtractor_4bit;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire [3:0] Diff;
    wire Bout_final;

    // Instantiate the Unit Under Test (UUT)
    subtractor_4bit uut (
        .A(A),
        .B(B),
        .Diff(Diff),
        .Bout_final(Bout_final)
    );

    initial begin
        // --- Waveform Generation Commands ---
        $dumpfile("waveform.vcd");      // Name of the output waveform file
        $dumpvars(0, tb_subtractor_4bit); // Dump all variables in this module

        // System monitor for console output
        $monitor("Time = %0t | A = %d, B = %d | Diff = %b, Bout = %b", $time, A, B, Diff, Bout_final);

        // Initialize Inputs
        A = 0; B = 0;
        #10; 

        // Test Case 1: Simple subtraction (A > B)
        A = 4'd7; B = 4'd2;
        #10;

        // Test Case 2: A equals B
        A = 4'd10; B = 4'd10;
        #10;

        // Test Case 3: A < B (Generates a borrow out)
        A = 4'd3; B = 4'd7;
        #10;

        // Test Case 4: Maximum positive values
        A = 4'd15; B = 4'd5;
        #10;

        // Test Case 5: 0 minus 1
        A = 4'd0; B = 4'd1;
        #10;

        // End simulation
        $finish;
    end

endmodule
