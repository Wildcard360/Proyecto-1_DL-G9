module error(
    input [2:0] s, // entrada del switch s para seleccionar el bit a modificar
    input [6:0] hamming, // codigo hamming 
    output [6:0] hamming_con_error // hamming con el error introducido
    );

    reg [6:0] codigo_hamming; // registro para almacenar el codigo hamming con el error
    always @(*) begin 
        codigo_hamming = hamming; // iniciamos igualando el codigo hamming original al registro
        // en el case se introduce el error dependiendo de s
        case (s)
            3'b000: codigo_hamming = hamming; // no cambia
            3'b001: codigo_hamming[0] = ~hamming[0]; // Error en p1 
            3'b010: codigo_hamming[1] = ~hamming[1]; // Error en p2
            3'b011: codigo_hamming[2] = ~hamming[2]; // Error en d1
            3'b100: codigo_hamming[3] = ~hamming[3]; // Error en p4
            3'b101: codigo_hamming[4] = ~hamming[4]; // Error en d2
            3'b110: codigo_hamming[5] = ~hamming[5]; // Error en d3
            3'b111: codigo_hamming[6] = ~hamming[6]; // Error en d4
        endcase
    end

    assign hamming_con_error = codigo_hamming; // se cambia el valor del registro al output
endmodule
