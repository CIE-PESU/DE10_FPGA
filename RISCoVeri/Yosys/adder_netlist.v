/* Generated by Yosys 0.5+ (git sha1 f13e387, gcc 5.3.1-8ubuntu2 -O2 -fstack-protector-strong -fPIC -Os) */

(* top =  1  *)
(* src = "adder_tree.v:3" *)
module adder_tree(a, b, c, d, e, f, g, h, clk, rst, y);
  (* src = "adder_tree.v:11" *)
  wire [8:0] _00_;
  (* src = "adder_tree.v:11" *)
  wire [8:0] _01_;
  (* src = "adder_tree.v:11" *)
  wire [8:0] _02_;
  (* src = "adder_tree.v:11" *)
  wire [8:0] _03_;
  (* src = "adder_tree.v:11" *)
  wire [9:0] _04_;
  (* src = "adder_tree.v:11" *)
  wire [9:0] _05_;
  (* src = "adder_tree.v:11" *)
  wire [10:0] _06_;
  (* src = "adder_tree.v:3" *)
  input [7:0] a;
  (* src = "adder_tree.v:3" *)
  input [7:0] b;
  (* src = "adder_tree.v:3" *)
  input [7:0] c;
  (* src = "adder_tree.v:4" *)
  input clk;
  (* src = "adder_tree.v:3" *)
  input [7:0] d;
  (* src = "adder_tree.v:3" *)
  input [7:0] e;
  (* src = "adder_tree.v:3" *)
  input [7:0] f;
  (* src = "adder_tree.v:3" *)
  input [7:0] g;
  (* src = "adder_tree.v:3" *)
  input [7:0] h;
  (* src = "adder_tree.v:9" *)
  reg [10:0] i31;
  (* src = "adder_tree.v:4" *)
  input rst;
  (* src = "adder_tree.v:5" *)
  output [10:0] y;
  assign _00_ = a + (* src = "adder_tree.v:22" *) b;
  assign _01_ = c + (* src = "adder_tree.v:23" *) d;
  assign _02_ = e + (* src = "adder_tree.v:24" *) f;
  assign _03_ = g + (* src = "adder_tree.v:25" *) h;
  assign _04_ = _00_ + (* src = "adder_tree.v:26" *) _01_;
  assign _05_ = _02_ + (* src = "adder_tree.v:27" *) _03_;
  assign _06_ = _04_ + (* src = "adder_tree.v:28" *) _05_;
  always @(posedge clk)
      i31 <= _06_;
  assign y = i31;
endmodule
