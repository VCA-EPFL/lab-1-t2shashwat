import Vector::*;

typedef Bit#(16) Word;

function Vector#(16, Word) naiveShfl(Vector#(16, Word) in, Bit#(4) shftAmnt);
    Vector#(16, Word) resultVector = in; 
    for (Integer i = 0; i < 16; i = i + 1) begin
        Bit#(4) idx = fromInteger(i);
        resultVector[i] = in[shftAmnt+idx];
    end
    return resultVector;
endfunction


function Vector#(16, Word) barrelLeft(Vector#(16, Word) in, Bit#(4) shftAmnt);
    
    Vector#(16, Word) resultVector = case (shftAmnt) matches
        /*'b0000: in;
        'b0001: (unpack(pack(in) >> 1));
        'b0010: (unpack(pack(in) >> 2*16));
        'b0011: (unpack(pack(in) << 3));
        'b0100: (unpack(pack(in) << 4));
        'b0101: (unpack(pack(in) << 5));
        'b0110: (unpack(pack(in) << 6));
        'b0111: (unpack(pack(in) << 7));
        'b1000: (unpack(pack(in) << 8));
        'b1001: (unpack(pack(in) << 9));
        'b1010: (unpack(pack(in) << 10));
        'b1011: (unpack(pack(in) << 11));
        'b1100: (unpack(pack(in) << 12));
        'b1101: (unpack(pack(in) << 13));
        'b1110: (unpack(pack(in) << 14));
        'b1111: (unpack(pack(in) << 15));*/
        
        'b0000: in;
        'b0001: naiveShfl(in, 1);
        'b0010: naiveShfl(in, 2);
        'b0011: naiveShfl(in, 3);
        'b0100: naiveShfl(in, 4);
        'b0101: naiveShfl(in, 5);
        'b0110: naiveShfl(in, 6);
        'b0111: naiveShfl(in, 7);
        'b1000: naiveShfl(in, 8);
        'b1001: naiveShfl(in, 9);
        'b1010: naiveShfl(in, 10);
        'b1011: naiveShfl(in, 11);
        'b1100: naiveShfl(in, 12);
        'b1101: naiveShfl(in, 13);
        'b1110: naiveShfl(in, 14);
        'b1111: naiveShfl(in, 15);
    
    endcase;
    return resultVector;
    // Implementation of a left barrel shifter
endfunction
