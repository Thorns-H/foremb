#!/usr/bin/env foremb

# ----- Relacionado a la Traduccion a Braille -----

# Mensaje de presentación de la tradución
: braille_results
" - Translation Results:" $. pdrop 10 emit
"    -> Input:  " $. pdrop $. 10 emit 
"    -> Output: " $. pdrop
;

# Mensaje de finalizacion de la traducción
: end_braille
"    -> Word Size: " $. drop . pdrop 10 emit
;

# Esta palabra nos ayuda a limpiar el pointer stack cuando los
# caracteres son comparables en Braille.
: c_ps drop pdrop ;

# Esta palabra se encarga de comparar los chars y
# imprimir el Braille correspondiente
: emit_braille
if dup 'A' = { "⠁" $. c_ps }
elif dup 'B' = { "⠃" $. c_ps }
elif dup 'C' = { "⠉" $. c_ps }
elif dup 'D' = { "⠙" $. c_ps }
elif dup 'E' = { "⠑" $. c_ps }
elif dup 'F' = { "⠋" $. c_ps }
elif dup 'G' = { "⠛" $. c_ps }
elif dup 'H' = { "⠓" $. c_ps }
elif dup 'I' = { "⠊" $. c_ps }
elif dup 'J' = { "⠚" $. c_ps }
elif dup 'K' = { "⠅" $. c_ps }
elif dup 'L' = { "⠇" $. c_ps }
elif dup 'M' = { "⠍" $. c_ps }
elif dup 'N' = { "⠝" $. c_ps }
elif dup 'O' = { "⠕" $. c_ps }
elif dup 'P' = { "⠏" $. c_ps }
elif dup 'Q' = { "⠟" $. c_ps }
elif dup 'R' = { "⠗" $. c_ps }
elif dup 'S' = { "⠎" $. c_ps }
elif dup 'T' = { "⠞" $. c_ps }
elif dup 'U' = { "⠥" $. c_ps }
elif dup 'V' = { "⠧" $. c_ps }
elif dup 'W' = { "⠺" $. c_ps }
elif dup 'X' = { "⠭" $. c_ps }
elif dup 'Y' = { "⠽" $. c_ps }
elif dup 'Z' = { "⠵" $. c_ps }
elif dup '0' = { "⠴⠂" $. c_ps }
elif dup '1' = { "⠂" $. c_ps }
elif dup '2' = { "⠆" $. c_ps }
elif dup '3' = { "⠒" $. c_ps }
elif dup '4' = { "⠲" $. c_ps }
elif dup '5' = { "⠢" $. c_ps }
elif dup '6' = { "⠖" $. c_ps }
elif dup '7' = { "⠶" $. c_ps }
elif dup '8' = { "⠦" $. c_ps }
elif dup '9' = { "⠔" $. c_ps }
elif dup '.' = { "⠲⠆" $. c_ps }
elif dup ',' = { "⠂⠂" $. c_ps }
elif dup '!' = { "⠖⠂" $. c_ps }
elif dup '?' = { "⠦⠦" $. c_ps }
elif dup '-' = { "⠤⠤" $. c_ps }
elif dup '_' = { "⠤⠤⠤" $. c_ps }
elif dup ':' = { "⠒⠒" $. c_ps }
elif dup ';' = { "⠆⠆" $. c_ps }
else { emit }
;

# Esta palabra se encarga de iterar sobre la palabra
# y obtener el braille correspondiente.
: $to_braille
braille_results
0 while dup $@c dup
{
emit_braille
++
}
10 emit end_braille 10 emit
;