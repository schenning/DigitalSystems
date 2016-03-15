typedef enum {A, B, C, X} selection;
typedef enum {WAIT, IDLE, READY, BUSY} controller_state;

module main(clk);
input clk;
input reqA, reqB, reqC;
output ackA, ackB, ackC;

selection wire sel;
wire active;

assign active = pass_tokenA || pass_tokenB || pass_tokenC;

controller controllerA(clk, reqA, ackA, sel, pass_tokenA, A);
controller controllerB(clk, reqB, ackB, sel, pass_tokenB, B);
controller controllerC(clk, reqC, ackC, sel, pass_tokenC, C);
arbiter arbiter(clk, sel, active);

endmodule

module controller(clk, req, ack, sel, pass_token, id);
input clk, req, sel, id;
output ack, pass_token;

selection wire sel, id;
reg ack, pass_token;
controller_state reg state;

initial state = IDLE;
initial ack = 0;
initial pass_token = 1;

wire is_selected;
assign is_selected = (sel == id);

always @(posedge clk) begin
  case(state)
    IDLE:
      if (is_selected)
        if (req)
          begin
          state = READY;
          end
        else
          pass_token = 1;
      else
        pass_token = 0;
    READY:
      begin
      state = BUSY;
      ack = 1;
      end
    BUSY:
      if (!req)
        begin
        state = WAIT;
        ack = 0;
        pass_token = 1;
        end
    WAIT:
      if (is_selected)
        if (req)
          begin
          state = READY;
          end
        else
          pass_token = 1;
      else
        pass_token = 0;
  endcase
end
endmodule

module arbiter(clk, sel, active);
input clk, active;
output sel;

selection wire sel;
selection reg state;

initial state = A;

assign sel = active ? state: X;

always @(posedge clk) begin
  case(state) 
    A:
      state = B;
    B:
      state = C;
    C:
      state = A;
  endcase
end
endmodule

