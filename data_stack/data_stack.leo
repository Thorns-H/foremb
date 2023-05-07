#!/usr/bin/env foremb

# El primer ejercicio que es la expresión 3 + 4: 7

3 4 +
. 32 emit

# El segundo ejercicio que es la expresión 17 + 20 + 132 + 3 + 9: 181

17 20 + 132 + 3 + 9 +
. 32 emit

# El tercer ejercicio que es la expresión ((3+4)*(5+1))/(7-9): -21

3 4 +
5 1 + *
7 9 - s/
s. 32 emit

# El cuarto ejercicio contiene varios incisos, pasemos por cada uno de ellos;
# Cada número de la siguiente linea representa una variable c,b,a en ese orden
# y se usará en cada ejercicio siguiente nuevamente.
3 2 1

# La expresión ab + c: (1*2)+3 = 5
* +
. 3 2 1 32 emit

# La expresión a-4b/6 + c: ((1-(4*2))/6) + 3 = 1.83333
swap 4 * -
6 s/ +
. 3 2 1 32 emit

# La expresion a/8b: 1/(8*2) = 0.0625
swap 8 * / . drop 
3 2 1 32 emit

# La expresion 5ab/10: (5*1*2)/10 = 1
5 * * 10 / . drop
3 2 1 32 emit

# La expresion a(2a+3): 1((2*1)+3) = 5
dup 2 * 3 + * . drop drop
3 2 1 32 emit

# La expresion a-b/c: (1-2)/3 = -0.33333
swap - swap s/ s.

# Presentamos la pila de datos al final del script.
10 10 emit emit ds. 10 emit
