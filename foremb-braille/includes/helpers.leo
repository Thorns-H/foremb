#!/usr/bin/env foremb

# ----- Operadores Agregados -----

# Operador de Desigualdad
: != = if 1 = { 0 } else { 1 } ;

# ----- Relacionado a Interaccion con la Terminal -----

: os:input
1 while dup 1 = { os:key if dup 10 != { . } else { drop drop 0 } } drop
;

# ----- Relacionado al Mantenimiento de Pilas ------

# Esta palabra nos ayuda a limpiar el pointer stack cuando los
# caracteres son comparables en Braille.
: c_ps drop pdrop ;