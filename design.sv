module half_subtractor (
    input X,
    input Y,
    output Diff,
    output Bout
);

    assign Diff = X ^ Y;
    assign Bout = (~X) & Y;

endmodule

module full_subtractor (
    input X,
    input Y, 
    input Bin,
    output Diff,
    output Bout
);

    assign Diff = X ^ Y ^ Bin;
    assign Bout = ((~X) & Y) | (~(X ^ Y) & Bin);

endmodule

module subtractor_4bit (
    input [3:0] A,
    input [3:0] B,
    output [3:0] Diff,
    output Bout_final
);

    wire [3:0] b;

    assign Bout_final = b[3];

    genvar i;

    generate
        for(i = 0; i < 4; i = i + 1) begin : sub_gen
            if(i == 0) begin
                half_subtractor hs (
                    .X(A[i]),
                    .Y(B[i]),
                    .Diff(Diff[i]),
                    .Bout(b[i])
                );
            end else begin
                full_subtractor fs (
                    .X(A[i]),
                    .Y(B[i]),
                    .Bin(b[i-1]),
                    .Diff(Diff[i]),
                    .Bout(b[i])
                );
            end
        end
    endgenerate

endmodule
