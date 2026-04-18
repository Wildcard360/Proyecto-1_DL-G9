module top (
    input logic [3:0] sw,           // A (MSB), B,C,D.. Del 0 al 3 hay 4 bits
    output logic [6:0] segments,
    output logic [3:0] led  
);

    /* Esta seccion de codigo no representa nada funcional, solo se asigna un nombre a 
    cada bit para escribir las ecuaciones boooleanas con mayor facilidad.
    Como renombrar un nodo.     */
assign A = sw[3];
assign B = sw[2];
assign C = sw[1];
assign D = sw[0];
    //

    /*Esta seccion de codigo presenta la logica booleana necesaria para las salidas del sistema, 
    las cuales se deben conectar a un respectivo segmento del display.*/
    //Leds que representan los inputs (bits binarios) de los switches en la protoboard
assign led [0] = ~D;
assign led [1] = ~C;
assign led [2] = ~B;
assign led [3] = ~A;
//Toda la lógica booleana se obtuvo con un analísis de mapas de Karnaugh montado en Excel.
assign segments[0] = (~B & ~D) |               // segmento A
                    (~A & C) |
                    (A & ~D) |
                    (B & C) |
                    (A & ~B & ~C) |
                    (~A & B & D);  

assign segments[1] = (~B & ~C) |     // segmento B
                    (~B & ~D) |
                    (~A & ~C & ~D) |
                    (~A & C & D) |
                    (A & ~C & D); 

assign segments[2] = (~B & ~C) |     // segmento C
                    (~B & D) |
                    (~C & D) |
                    (~A & B ) |
                    (A & ~B);
        

assign segments[3] = (~B & ~C & ~D) |     // segmento D
                    (~A & C & ~D) |
                    (~B & C & D) |
                    (B & ~C & D) |
                    (A & B & ~D);

assign segments[4] = (~B & ~D) |          // segmento E
                    (C & ~D) |
                    (A & C)|
                    (A & B);

assign segments[5] = (~C & ~D) |         // segmento F
                    (B & ~D) |
                    (A & ~B) |
                    (A & C) |
                    (~A & B & ~C); 

assign segments[6] = (~B & C) |         // segmento G
                    (C & ~D) |
                    (A & ~B) |
                    (A & D) |
                    (~A & B & ~C);                            
    
endmodule