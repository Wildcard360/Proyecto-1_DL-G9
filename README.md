# Proyecto-1_DL-G9
Este es el repositorio del proyecto #1 realizado por el grupo 9 conformado por los estudiantes Gabriel Tenorio y Krisdel Guido


El circuito en general se divide en dos módulos principales: 7 Segmentos, y Hamming.

#7 Segmentos

La parte del 7 segmentos funciona principalmente gracias a la lógica booleana de cada segmento individual. En la programación esto funciona de forma tal que el estado de encendido y apagado de cada segmento individual es determinado por una serie de compuertas lógicas, en este caso, con la interpretación de Verilog de la lógica booleana, donde cada bit de la entrada influye en el estado del segmento en cuestión. 

<img width="1826" height="1425" alt="IMG_8211" src="https://github.com/user-attachments/assets/3a729e57-f76f-4bff-ade6-dd16d1a54786" />

Para el diseño de los switches, se toma en cuenta que se tiene que aplicar una resistencia pull down, para establecer el estado 0 como default en las entradas percibidas por la tangnano. En este diseño se utilizaron unicamente resistencias de 1k Ohm para el pull down, y concretamente se utilizaron 7 resistencias de 330 Ohm para cada segmento individual del 7 segmentos. El 7 Seg utilizado es de Catodo común para facilitar las conexiones. Especificamente, los switches permitían una tensión de 3.3v, la cual era medida por las entradas de la tangnano, especificamente de 3.3v igualmente, las salidas del 7 segmentos, emitían una tensión de 1.8v.

#Hamming.
Para la parte del circuito, básicamente es el mismo diseño, con la excepción de que en este caso tenemos 3 inputs adicionales a tomar en cuenta en los constraints, estos switches operando igual con una tensión de 3.3v y resistencias de pull down de 1k Ohm


# Karnaugh
Para la parte de los 7 segmentos, se utilizó la simplificación de ecuaciones booleanas con el metodo de mapas de Karnaugh.
Esto se logró haciendo primero un excel con la tabla de verdad, especificamente considerando la sálida para cada segmento individual. 
<img width="1167" height="479" alt="image" src="https://github.com/user-attachments/assets/5fbdc912-ba1e-4526-8bb0-77ae3969eeb3" />
Una vez hecho esto se acomodaron los datos en el formato de los mapas de Karnaugh, y se simplificaron las ecuaciones agrupando los 1's en grupos de potencias de 2.
<img width="1047" height="115" alt="image" src="https://github.com/user-attachments/assets/e85725c8-92fe-47a8-ba93-589800fa1543" />
<img width="704" height="121" alt="image" src="https://github.com/user-attachments/assets/ba4b3c7c-2f6c-4716-976c-b92a633afbfe" />
<img width="1082" height="161" alt="image" src="https://github.com/user-attachments/assets/14c1b493-beb3-4298-9674-8893e4087ed2" />
De esta forma, haciendo uso de los mapas de Karnaugh se simplificaron las ecuaciones booleanas y se obtuvo la lógica para plantear la programación en Verilog.

# Simulación
<img width="1045" height="579" alt="image" src="https://github.com/user-attachments/assets/d3ef9f31-dc84-42ef-ada2-972de88833b6" />
Donde se ve la simulación en el testbench del módulo 7 segmentos, donde probando la lógica con las diferentes entradas, se ve que concuerdan los datos simulados con los resultados esperados.

# Análisis de consumo de recursos en la FPGA (LUTs, FFs, etc.) y del consumo de potencia que reporta
las herramientas.
<img width="701" height="181" alt="image" src="https://github.com/user-attachments/assets/0df9055f-cfb8-41df-915b-b2838756044f" />
Viendo que se trabajó solamente utilizando un voltaje de 3.3v y resistencias de 1k podemos estimar que la potencia consumida oscila entre 10.89mW y 76.23mW


# Análisis de principales problemas hallados durante el trabajo y de las soluciones aplicadas.
Los principales problemas hallados dentro del trabajo se debieron a la falta de experiencia con Verilog y con la tangnano 9k. A la hora de probar el funcionamiento de la FPGA, tuvimos problemas con las definiciones, especificamente, para los inputs, pusimos un valor de drive de 8 mA, siendo que Verilog tira un error si se define un valor de corriente concreto para un input.
<img width="1110" height="278" alt="image" src="https://github.com/user-attachments/assets/d904d20f-9837-4890-a8e2-34502a270b80" />
Para solucionar esto, nos fijamos en el template de los constraints para definir individualmente sus atributos.

Adicionalmente, tuvimos que adaptar el diseño para usar jumpers hembra-macho, ya que originalmente al tratar de conectar la FPGA directo a la protoboard, vimos que las conexiones eran debiles, y al más mínimo movimiento, se desconectaban, por lo que tuvimos que hacer este cambio en el diseño físico.
<img width="1215" height="1620" alt="image" src="https://github.com/user-attachments/assets/764cdd0e-3cc0-499d-9069-6a08a7fe355a" />
<img width="1215" height="1620" alt="image" src="https://github.com/user-attachments/assets/fd6a0c18-a183-4df8-984c-ef0d32280c5c" />





# Anillo Oscilador
<img width="579" height="691" alt="image" src="https://github.com/user-attachments/assets/4bc5d9ad-16c2-4f5b-b47e-f8c5825da3a1" />
A
<img width="487" height="438" alt="image" src="https://github.com/user-attachments/assets/a3687497-dd0e-4859-969d-c4352cb2b324" />
B
<img width="601" height="484" alt="image" src="https://github.com/user-attachments/assets/0bebd65b-3a76-448b-93d5-08fb9303b81a" />
C
<img width="550" height="409" alt="image" src="https://github.com/user-attachments/assets/dbad629f-2357-4b4a-a5ac-349eacf83166" />
D





