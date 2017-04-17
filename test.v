module test;

  wire LED1;
  wire LED2;
  wire LED3;
  wire LED4;
  wire LED5;

  /* Make a regular pulsing clock. */
  reg clk = 0;
  always #5 clk = !clk;

  top t (clk, LED1, LED2, LED3, LED4, LED5);

  initial
     $monitor("At time %t, LED1 = %h, LED2 = %h, LED3 = %h, LED4 = %h, LED5 = %h",
              $time, LED1, LED2, LED3, LED4, LED5);
endmodule
