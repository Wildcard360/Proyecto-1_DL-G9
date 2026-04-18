module hamming(
    input [3:0] datos, //entrada del switch datos
    output [6:0] hamming_codigo // salida con el codigo hamming (7 bits) 
    );


    reg p1, p2, p4; // bits de paridad

    always @(*) begin
        p1 = datos[0] ^ datos[1] ^ datos[3]; // p1 se calcula con d1, d2 y d4 con XOR
        p2 = datos[0] ^ datos[2] ^ datos[3];
        p4 = datos[1] ^ datos[2] ^ datos[3];
    end
    // aqui se ordenan los bits del codigo hamming, los bits de datos se colocan en las posiciones 3, 5, 6 y 7, 
    //mientras que los bits de paridad se colocan en las posiciones 1, 2 y 4
    assign hamming_codigo = {
    datos[3],  // d4 (7)
    datos[2],  // d3 (6)
    datos[1],  // d2 (5)
    p4,         // p4 (4)
    datos[0],  // d1 (3)
    p2,         // p2 (2)
    p1          // p1 (1)
    };

endmodule
