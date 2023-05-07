#!/usr/bin/env foremb

# Definimos nuevas palabras para el uso de saltos de línea
# y también de espacios en la terminal.
: space 32 emit ;
: newline 10 emit ;
: border "\ESC[1m" $. "\ESC[92m" $. 42 emit "\ESC[0m" $. ;

# Definimos una nueva palabra para imprimir el estado de la
# pila de datos al finalizar el programa.
: finish newline newline ds. newline ;

# Definimos las variables que contabilizarán donde esta nuestra
# ventana en la terminal.
30 variable y
: increment_y y @ ++ y ! ;

# Insertamos los valores a la Pila de Datos: (C2 C1 -) 
15 30 dup

# Este ciclo imprime los bordes horizontales
15 y @ os:gotoxy repeat
dup border drop --
until dup 0 = ;
increment_y

# Esto de aquí formtatea la pila de forma que podemos
# usar el segundo valor para el siguiente ciclo.
newline drop over 2 - over 2 - swap

# Este primer ciclo anidado es el responsable de 
# imprimir los bordes y contar las líneas.
15 y @ os:gotoxy repeat
swap border swap -- swap dup

# Este segundo ciclo anidado es el responsable de
# imprimir los espacios en blanco dentro de la ventana.
while dup 0 >
{
-- space
}
border newline 15 y @ os:gotoxy drop swap increment_y
until dup 0 = ;

# Limpiamos la pila
drop drop swap drop

# Volvemos a crear un ciclo para el ultimo borde.
repeat
dup border drop --
until dup 0 = ; drop

# Finalizamos el script.
finish