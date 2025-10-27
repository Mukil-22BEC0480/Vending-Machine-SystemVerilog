// Vending Machine FSM
// Accepts ₹5 and ₹10 coins, product costs ₹15

module vending_machine(
    input  logic clk,
    input  logic reset,
    input  logic [1:0] coin,    // 00: No coin, 01: ₹5, 10: ₹10
    output logic dispense,      // 1: Dispense product
    output logic [1:0] change   // 00: No change, 01: ₹5, 10: ₹10
);

    typedef enum logic [1:0] {
        S0,   // ₹0
        S5,   // ₹5
        S10,  // ₹10
        S15   // ₹15 or more
    } state_t;

    state_t state, next_state;

    // Sequential block
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Combinational block
    always_comb begin
        next_state = state;
        dispense = 0;
        change = 2'b00;

        case (state)
            S0: begin
                if (coin == 2'b01) next_state = S5;
                else if (coin == 2'b10) next_state = S10;
            end

            S5: begin
                if (coin == 2'b01) next_state = S10;
                else if (coin == 2'b10) next_state = S15;
            end

            S10: begin
                if (coin == 2'b01) next_state = S15;
                else if (coin == 2'b10) begin
                    next_state = S15;
                    change = 2'b01; // ₹5 change
                end
            end

            S15: begin
                dispense = 1;
                next_state = S0; // Reset after dispensing
            end
        endcase
    end

endmodule
