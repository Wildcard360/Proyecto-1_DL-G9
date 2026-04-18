module top (
    input [3:0] datos, // entrada del switch datos
    input [2:0] s, // entrada del switch s para seleccionar el bit a modificar
    output [6:0] ham // salida con el codigo hamming (7 bits) para conectar al display
);
    wire [6:0] hamming_codigo; // cable para conectar la salida del modulo hamming con la entrada del modulo error

    // instancia del modulo hamming
    hamming calculo_hamming (
        .datos(datos),
        .hamming_codigo(hamming_codigo)
    );

    // instancia del modulo error
    error generador_error (
        .s(s),
        .hamming(hamming_codigo),
        .hamming_con_error(ham)
    );
    
endmodule