`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer:kishan 
// 
// Create Date: 06.06.2025 18:35:03
// Design Name: 
// Module Name: ripple_carry
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ripple_carry(input [3:0]a,b,input cin,output [3:0]sum,output cout);
wire co1,co2,co3;
fulladder f1(a[0],b[0],cin,sum[0],co1);
fulladder f2(a[1],b[1],co1,sum[1],co2);
fulladder f3(a[2],b[2],co2,sum[2],co3);
fulladder f4(a[3],b[3],co3,sum[3],cout);
endmodule

module testbench;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;
ripple_carry m1(a,b,cin,sum,cout);
initial begin
$monitor("a=%d,b=%d,c=%d result =%d%d",a,b,cin,cout,sum);
repeat(10)
begin
a=$random;
b=$random;
cin=$random;
#10;
end
$finish;
end
endmodule