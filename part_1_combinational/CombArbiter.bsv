import Vector::*;

typedef struct {
 Bool valid;
 Bit#(31) data;
 Bit#(4) index;
} ResultArbiter deriving (Eq, FShow);

function ResultArbiter arbitrate(Vector#(16, Bit#(1)) ready, Vector#(16, Bit#(31)) data);
    ResultArbiter resArb = ResultArbiter{valid: False, data : 0, index: 0};
    for (Integer i = 0; i < 16; i = i + 1) begin
        if (ready[i] == 1) 
            resArb = ResultArbiter{valid: True, data: data[i], index: fromInteger(i)};
    end
    //$display("%b", resArb.valid);
	return resArb;
endfunction

