
module TEST(A, B,C,F);
   
   output F;
   input  A, B,C;
   wire D,E,A2,R;
  
   and G1(D, A, B);
   not G2(A2,A)
   and G3(E, A2,B);
   and G4(R, C, B);
   or G5(F,E,D,R);

  initial
       begin
   A = 0;
   B = 0;
   C = 0;
   #10;
   A = 0;
   B = 0;
   C = 1;
   #10;  
   A = 0;
   B = 1;
   C = 0;
   #10;
   A = 0;
   B = 1;
   C = 1;
   #10;
   A = 1;
   B = 0;
   C= 0;
   #10;
   A = 1;
   B = 0;
   C= 1;
   #10;
   A = 1;
   B = 1;
   C = 0;
   #10;  
   A = 1;
   B = 1;
   C= 1;
   #10;  
  end

endmodule

     
