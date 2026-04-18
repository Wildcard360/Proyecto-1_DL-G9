module t_error;

    reg [2:0] s; 
    reg [6:0] hamming;
    wire [6:0] hamming_con_error;

    
    error prueba (
        .s(s),
        .hamming(hamming),
        .hamming_con_error(hamming_con_error)
    );

    // Archivo de ondas
    initial begin
        $dumpfile("error.vcd");
        $dumpvars;
    end

    // al poner make test se muestra el valor de s, hamming y hamming_con_error cada vez que cambian
    initial begin
        $monitor("t=%0t | s=%b | hamming=%b | error=%b",
                  $time, s, hamming, hamming_con_error);
    end

    // Pruebas, aqui se ponen tres codigos hamming diferentes y se prueban todos los posibles valores de s y errores
    initial begin
        
        hamming = 7'b1010101;

        s = 3'b000; #10;
        s = 3'b001; #10;
        s = 3'b010; #10;
        s = 3'b011; #10;
        s = 3'b100; #10;
        s = 3'b101; #10;
        s = 3'b110; #10;
        s = 3'b111; #10;
        
        hamming = 7'b1010111;

        s = 3'b000; #10;
        s = 3'b001; #10;
        s = 3'b010; #10;
        s = 3'b011; #10;
        s = 3'b100; #10;
        s = 3'b101; #10;
        s = 3'b110; #10;
        s = 3'b111; #10;
 
        hamming = 7'b1110101;

        s = 3'b000; #10;
        s = 3'b001; #10;
        s = 3'b010; #10;
        s = 3'b011; #10;
        s = 3'b100; #10;
        s = 3'b101; #10;
        s = 3'b110; #10;
        s = 3'b111; #10;
        $finish;
    end

endmodule