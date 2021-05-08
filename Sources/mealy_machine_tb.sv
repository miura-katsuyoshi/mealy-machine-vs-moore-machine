module mealy_machine_tb;
    timeunit 1ns;
    timeprecision 1ps;
    logic clk;
    logic in;
    logic out;
    mealy_machine mealy_machine(
        .clk(clk),
        .in(in),
        .out(out)
    );
    initial clk <= 1'b1;
    always #5 clk <= ~clk;
    program main;
        default clocking cb @(posedge clk);
        endclocking
        initial begin
            $monitor("%t: in=%b, s=%b, out=%b", $realtime, in, mealy_machine.s, out);
                    in = 1'b0;
            ##1     in = ~in;
            ##1     in = ~in;
            ##2 #3  in = ~in;
            ##2     in = ~in;
            ##3 #3  in = ~in;
                #2  in = ~in;
                #2  in = ~in;
            ##3     in = ~in;
            ##1;
        end
    endprogram
endmodule
