module alu_tb();
    // Registers to drive inputs
    reg [3:0] A, B;
    reg [2:0] Op;
    // Wires to observe outputs
    wire [3:0] Result;
    wire CarryOut;

    // Instantiate the ALU (Unit Under Test)
    alu_4 uut (
        .A(A), .B(B), .Op(Op), 
        .Result(Result), .CarryOut(CarryOut)
    );

    initial begin
        // Test 1: Addition (5 + 3 = 8)
        A = 4'd5; B = 4'd3; Op = 3'b000;
        #10; // Wait 10 nanoseconds
        
        // Test 2: Subtraction (10 - 4 = 6)
        A = 4'd10; B = 4'd4; Op = 3'b001;
        #10;
        
        // Test 3: Logical AND (1100 & 1010 = 1000)
        A = 4'b1100; B = 4'b1010; Op = 3'b010;
        #10;
        
        // Test 4: Addition with Overflow (15 + 1)
        A = 4'd15; B = 4'd1; Op = 3'b000;
        #10;

        $finish; // End simulation
    end
endmodule
