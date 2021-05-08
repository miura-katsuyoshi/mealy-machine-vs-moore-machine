module mealy_machine(
    input logic clk,
    input logic in,
    output logic out
);
    enum logic { S0, S1, DO_NOT_CARE=1'bx } s;
    always_ff @(posedge clk) begin
        unique case({s,in})
            {S0, 1'b0} : s <= S0;
            {S0, 1'b1} : s <= S1;
            {S1, 1'b0} : s <= S0;
            {S1, 1'b1} : s <= S1;
            default: s <= DO_NOT_CARE;
        endcase
    end
    always_comb begin
        unique case({s,in})
            {S0, 1'b0} : out = 1'b0;
            {S0, 1'b1} : out = 1'b1;
            {S1, 1'b0} : out = 1'b0;
            {S1, 1'b1} : out = 1'b0;
            default: out = 1'bx;
        endcase
    end
endmodule
