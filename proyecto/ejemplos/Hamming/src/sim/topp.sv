module topp;

    reg [3:0] datos;
    reg [2:0] s;
    wire [6:0] hamming_error;

    top pruebas (
        .datos(datos),
        .s(s),
        .hamming_error(hamming_error)
    );

    initial begin
        $dumpfile("topp.vcd");
        $dumpvars(0, topp);
    end

    initial begin
        datos = 4'b1010;
        s = 3'b000; #10;

        s = 3'b011; #10;

        datos = 4'b1111;
        s = 3'b101; #10;

        $finish;
    end

endmodule