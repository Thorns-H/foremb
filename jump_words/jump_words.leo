#!/usr/bin/env foremb

# Esta será la opción que vayamos a elegir
5
# Aquí duplicamos el valor que tenemos en la pila para hacer
# una comparación en cada jump, sin perder ese valor inicial.
dup 1 = jumpnz primera
dup 2 = jumpnz segunda
dup 3 = jumpnz tercera
dup 4 = jumpnz cuarta

dup 5 = jumpnz quinta

# Este ciclo muestra los numeros del 0 al 9
primera:
0
mostrar:
dup . 32 emit ++ dup 10 =
jumpz mostrar
jumpnz fin

# Este ciclo muestra los numeros del -9 al 0
segunda:
-9
mostrar_negativos: dup s. 32 emit ++ dup
jumpnz mostrar_negativos
jumpz terminar

# Este ciclo muestra las letras de la 'a' a la 'z'
tercera:
97
mostrar_minusculas:
dup emit ++ 32 emit dup 123 =
jumpz mostrar_minusculas
jumpnz terminar_simbolos

# Este ciclo muestra las letras de la 'A' a la 'Z'
cuarta:
65
mostrar_mayusculas:
dup emit ++ 32 emit dup 91 =
jumpz mostrar_mayusculas
jumpnz terminar_simbolos

# Este ciclo muestra todos los anteriores seguidos
quinta:
0
numeros: dup . 32 emit ++ dup 10 = 
jumpz numeros 1 10 emit
-9 
numeros_n: dup s. 32 emit ++ dup 
jumpnz numeros_n 0 . 0 1 10 emit
97
letras: dup emit ++ 32 emit dup 123 = 
jumpz letras 10 emit
65
letras_m: dup emit ++ 32 emit dup 91 = 
jumpz letras_m 10 10 emit emit jumpnz fin

# Ciclos auxiliares para terminar los bucles
terminar:
0 . 0
jumpz fin

terminar_simbolos:
emit

fin:
1