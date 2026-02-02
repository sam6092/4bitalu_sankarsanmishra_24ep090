module alu_4(
    input [3:0] A,          // 4-bit Input A
    input [3:0] B,          // 4-bit Input B
    input [2:0] Op,         // 3-bit Operation Selector
    output reg [3:0] Result, // 4-bit Output Result
    output reg CarryOut      // Overflow/Carry Flag
);

    always @(*) begin
        // Reset CarryOut to 0 by default
        CarryOut = 1'b0; 
        
        case(Op)
            3'b000: {CarryOut, Result} = A + B; // Addition 
            3'b001: Result = A - B;            // Subtraction 
            3'b010: Result = A & B;            // Bitwise AND 
            3'b011: Result = A | B;            // Bitwise OR 
            3'b100: Result = A ^ B;            // Bitwise XOR 
            default: Result = 4'b0000;
        endcase
    end
endmodule
