#!/usr/bin/env foremb

# ----- Helpers ------

# Esta palabra nos ayuda a limpiar el pointer stack cuando los
# caracteres son comparables en Braille.
: c_ps drop pdrop ;

# ----- Variables de Configuración -----

# Esta variable nos sirve para cambiar la ruta del archivo donde
# se guarda el resultado de la traduccion

"exports/braille.txt" $variable file_name
: get_file_name file_name $@ ;

# ----- Relacionado a Archivos -----

: $save_braille pdup $.
get_file_name "a" file:open
file< file:close c_ps
;

: $clear_braille get_file_name "w" file:open file:close ;

: $add_date
get_file_name "a" file:open " | "
file< file:close "date >> exports/braille.txt\n" file:run
; 

# ----- Relacionado a la Traduccion a Braille -----

# Mensaje de presentación de la tradución
: braille_results
" - Translation results:" $. pdrop 10 emit
"    -> Input:  " $. pdrop $. 10 emit 
"    -> Output: " $. pdrop
;

# Mensaje de finalizacion de la traducción
: end_braille
"    -> Word Size: " $. drop . pdrop
;

# Esta palabra se encarga de comparar los chars y
# imprimir el Braille correspondiente
: emit_braille
if dup 'A' = { "⠁" $save_braille }
elif dup 'B' = { "⠃" $save_braille }
elif dup 'C' = { "⠉" $save_braille }
elif dup 'D' = { "⠙" $save_braille }
elif dup 'E' = { "⠑" $save_braille }
elif dup 'F' = { "⠋" $save_braille }
elif dup 'G' = { "⠛" $save_braille }
elif dup 'H' = { "⠓" $save_braille }
elif dup 'I' = { "⠊" $save_braille }
elif dup 'J' = { "⠚" $save_braille }
elif dup 'K' = { "⠅" $save_braille }
elif dup 'L' = { "⠇" $save_braille }
elif dup 'M' = { "⠍" $save_braille }
elif dup 'N' = { "⠝" $save_braille }
elif dup 'O' = { "⠕" $save_braille }
elif dup 'P' = { "⠏" $save_braille }
elif dup 'Q' = { "⠟" $save_braille }
elif dup 'R' = { "⠗" $save_braille }
elif dup 'S' = { "⠎" $save_braille }
elif dup 'T' = { "⠞" $save_braille }
elif dup 'U' = { "⠥" $save_braille }
elif dup 'V' = { "⠧" $save_braille }
elif dup 'W' = { "⠺" $save_braille }
elif dup 'X' = { "⠭" $save_braille }
elif dup 'Y' = { "⠽" $save_braille }
elif dup 'Z' = { "⠵" $save_braille }
elif dup '0' = { "⠴⠂" $save_braille }
elif dup '1' = { "⠂" $save_braille }
elif dup '2' = { "⠆" $save_braille }
elif dup '3' = { "⠒" $save_braille }
elif dup '4' = { "⠲" $save_braille }
elif dup '5' = { "⠢" $save_braille }
elif dup '6' = { "⠖" $save_braille }
elif dup '7' = { "⠶" $save_braille }
elif dup '8' = { "⠦" $save_braille }
elif dup '9' = { "⠔" $save_braille }
elif dup '.' = { "⠲⠆" $save_braille }
elif dup ',' = { "⠂⠂" $save_braille }
elif dup '!' = { "⠖⠂" $save_braille }
elif dup '?' = { "⠦⠦" $save_braille }
elif dup '-' = { "⠤⠤" $save_braille }
elif dup '_' = { "⠤⠤⠤" $save_braille }
elif dup ':' = { "⠒⠒" $save_braille }
elif dup ';' = { "⠆⠆" $save_braille }
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
10 emit end_braille 10 emit $add_date
"    -> Saved in: " $. "\ESC[1m" $. pdrop "\ESC[32m" $. pdrop
get_file_name $. 10 10 emit emit "\ESC[0m" $. pdrop pdrop pdrop pdrop
;