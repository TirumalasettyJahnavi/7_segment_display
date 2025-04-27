module segment_7(clk,an,ca);
input clk;
output reg [3:0]an;
output reg [7:0]ca;
reg clk_1hz=0;
reg clk_seg=0;
reg [31:0]count_1hz=0;
reg [31:0]count_seg=0;
always@(posedge clk)begin
if (count_1hz==25000000)begin
   clk_1hz<=~clk_1hz;
   count_1hz<=0;
end   
else
   count_1hz=count_1hz+1;
end
always@(posedge clk)begin
if (count_seg==100000)begin
   clk_seg<=~clk_seg;
   count_seg<=0;
   end
else
    count_seg <= count_seg+1;  
end
reg [1:0]sel;
wire [7:0]ca1,ca2,ca3,ca4;
always@(posedge clk_seg)begin
case(sel)
 0:begin an<=4'b0001;
         ca<=ca1;end
 1:begin an<=4'b0010;
         ca<=ca2;end
 2:begin an<=4'b0100;
         ca<=ca3;end                 
 3:begin an<=4'b1000;
         ca<=ca4;end
endcase
sel<=sel+1;
end
wire [3:0]qn1,qn2,qn3,qn4;
counter c1(clk_1hz,qn1,qn2,qn3,qn4);
display d1(clk,qn1,ca1);
display d2(clk,qn2,ca2);
display d3(clk,qn3,ca3);
display d4(clk,qn4,ca4);
         
endmodule
