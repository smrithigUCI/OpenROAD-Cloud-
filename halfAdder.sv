interface halfAdder_If ;

  // Port List
  
   logic a_test;
   logic b_test;
   logic clk_test;
   logic sum_test;
   logic carry_test;
   
   

  // Monitor Modport
   
   modport cntr_mp (
                   input a_test,
     			   input b_test,
     			   input clk_test,
                   output sum_test,
                   output carry_test       
                   );

   initial begin : clock_gen
      clk_test = 1;
      forever #10 clk_test = ~clk_test;
   end

      
endinterface : halfAdder_If

module halfAdder(halfAdder_If.cntr_mp i);
  reg s; reg c;
  always@(posedge i.clk_test)
    begin
      s<=i.a_test^i.b_test;
      c<=i.a_test&i.b_test;
    end
  assign i.sum_test =s;
  assign i.carry_test =c;
endmodule
