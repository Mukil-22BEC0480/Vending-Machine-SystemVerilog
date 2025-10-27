// Testbench for Vending Machine FSM
module tb_vending_machine;
    logic clk, reset;
    logic [1:0] coin;
    logic dispense;
    logic [1:0] change;

    vending_machine uut (
        .clk(clk),
        .reset(reset),
        .coin(coin),
        .dispense(dispense),
        .change(change)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("vending_wave.vcd");
        $dumpvars(0, tb_vending_machine);

        clk = 0;
        reset = 1;
        coin = 2'b00;
        #10 reset = 0;

        // Insert ₹5 + ₹10 = ₹15 (should dispense)
        coin = 2'b01; #10;
        coin = 2'b10; #10;
        coin = 2'b00; #10;

        // Insert ₹10 + ₹10 = ₹20 (should dispense and return ₹5)
        coin = 2'b10; #10;
        coin = 2'b10; #10;
        coin = 2'b00; #10;

        // Insert ₹10 only (no dispense)
        coin = 2'b10; #10;
        coin = 2'b00; #10;

        $finish;
    end
endmodule
