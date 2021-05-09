module moore_machine(
    input logic clk,
    input logic in,
    output logic out
);
    enum logic [1:0] { S0=2'b10, SP=2'b00, S1=2'b01, DO_NOT_CARE=2'bxx } s;
    always_ff @(posedge clk) begin
        unique case({s,in})
            {S0, 1'b0} : s <= S0;
            {S0, 1'b1} : s <= SP;
            {SP, 1'b0} : s <= S0;
            {SP, 1'b1} : s <= S1;
            {S1, 1'b0} : s <= S0;
            {S1, 1'b1} : s <= S1;
            default: s <= DO_NOT_CARE;
        endcase
    end
    always_comb begin
        unique case({s,in})
            {S0, 1'b0} : out = 1'b0;
            {S0, 1'b1} : out = 1'b0;
            {SP, 1'b0} : out = 1'b1;
            {SP, 1'b1} : out = 1'b1;
            {S1, 1'b0} : out = 1'b0;
            {S1, 1'b1} : out = 1'b0;
            default: out = 1'bx;
        endcase
    end
endmodule
