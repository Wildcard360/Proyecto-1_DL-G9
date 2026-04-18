module thamming;

    reg [3:0] datos;
    wire [6:0] hamming_codigo;

    // instancia 
    hamming prueba (
        .datos(datos),
        .hamming_codigo(hamming_codigo)
    );
    // 
    initial begin
        // se asignan diferentes valores a datos para probar el calculo correcto de los bits de paridad
        datos = 4'b0000; #10;

        datos = 4'b0001; #10;

        datos = 4'b1010; #10;

        datos = 4'b1111; #10;

        $dumpfile("hamming.vcd");
        $dumpvars;

        $finish;
    end

endmodule
