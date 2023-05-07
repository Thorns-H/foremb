#!/usr/bin/env foremb

# Definimos nuevas palabras para el uso de saltos de línea
# y también de espacios en la terminal.
: space 32 emit ;
: newline 10 emit ;
: finish newline newline ds. newline ;

# Primer Ejercicio (Números del 0 al 9)
space 0 while dup 10 <
{
dup . space ++
}

# Limpiamos la pila de datos y hacemos una nueva línea
drop newline

# Segundo Ejercicio (Números del -9 al 0)
space -9 repeat
dup s. space ++
until dup 1 = ;

# Limpiamos la pila de datos y hacemos una nueva línea
drop newline

# Tercer Ejercicio (Letras de la 'a' a la 'z')
space for 97 upto 122 1
{
dup emit space
}

newline

# Cuarto Ejercicio (Letras de la 'A' a la 'Z')
space for 65 upto 90 1
{
dup emit space
}

finish