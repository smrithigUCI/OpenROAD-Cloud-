module halfAdder(input a,
                 input b,
                 input wire clk,
                 output sum,
                 output carry);
  reg sumReg,carryReg;
  initial 
    begin
      clk = 1'b0;
      forever #10 clk = ~clk;
    end
  always @(posedge clk)
    begin
      sumReg = a^b;
      carryReg = a&b;
    end
  assign sum = sumReg;
  assign carry = carryReg;
endmodule
