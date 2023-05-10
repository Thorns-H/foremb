#!/usr/bin/env foremb

include includes/helpers.leo ;

# ----- Codigos de Escape -----

: bold_green "\ESC[1m" $. pdrop "\ESC[32m" $. pdrop ;
: bold_red "\ESC[1m" $. pdrop "\ESC[31m" $. pdrop ;
: bold "\ESC[1m" $. pdrop ;
: reset_color "\ESC[0m" $. pdrop ;

# ----- Variables de Configuración -----

# Esta variable nos sirve para cambiar la ruta del archivo donde
# se guarda el resultado de la traduccion.
"exports/braille.txt" $variable file_name
: get_file_name file_name $@ ;

# Esta variable sirve de bandera para saber si el directorio se
# creo con la ultima ejecución de la traducción.
0 variable directory_flag
: get_directory_flag directory_flag @ ;
: activate_directory_flag 1 directory_flag ! ;

# Esta variable sirve de bandera para saber si el usuario solicito
# guardar el contenido en el archivo.
0 variable file_flag
: get_file_flag file_flag @ ;
: activate_file_flag 1 file_flag ! ;

# ----- Relacionado a Archivos -----

# Esta palabra sirve para tomar la respuesta del usuario en cuando a
# si desea guardar la traducción en un archivo.
: os:save_braille
os:key if dup 121 != { drop bold_red "✖" $. pdrop reset_color }
else { activate_file_flag bold_green "✔" $. pdrop reset_color }
;

# Esta palabra se encarga de verificar que el directorio de archivos exista,
# sino, crea el directorio.
: $make_directory
file:exists_directory if dup 1 != { "mkdir exports" file:run activate_directory_flag } drop
;

# Esta palabra guarda la letra asociada en Braille en el archivo de
# texto especificado en la varible "file_name"
: $save_braille
if get_file_flag 1 = { pdup $. get_file_name "a" file:open file< file:close c_ps }
else { $. c_ps }
;

# Esta palabra elimina todo el contenido del archivo asociado a la variable
# "file_name".
: $clear_braille get_file_name "w" file:open file:close ;

# Esta palabra hace uso del operador >> de la terminal, para redirigir el
# output de la fecha actual en el sistema, al final de cada traducción.
: $add_date
if get_file_flag 1 = 
{
get_file_name "a" file:open " | "
file< file:close "date >> exports/braille.txt\n" file:run
}
;

# Esta palabra sirve para ejecutar un script de bash que muestra el contenido
# del archivo en la terminal.
: $braille_content
" - File content:" $. pdrop 10 emit
"chmod +x scripts/show_braille.sh" file:run
"./scripts/show_braille.sh" file:run
10 emit
;

# ----- Relacionado a la Traduccion a Braille -----

# Mensaje de presentación de la tradución
: braille_results
" - Save the translation output? " $. pdrop bold "[y/n]: " $. pdrop reset_color
os:save_braille 10 emit 10 emit
" - Translation results:" $. pdrop 10 emit
"    -> Input:  " $. pdrop $. 10 emit 
"    -> Output: " $. pdrop
;

# Mensaje de finalizacion de la traducción
: end_braille
"    -> Word Size: " $. drop pdrop bold . 10 emit reset_color
"    -> Directory Status: " $. pdrop
bold_green if get_directory_flag 1 != { "Already existed" $. pdrop }
else { "Created exports directory" $. pdrop } reset_color
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
: $to_braille "exports" $make_directory
braille_results
0 while dup $@c dup
{
emit_braille
++
}
10 emit end_braille 10 emit $add_date
if get_file_flag 1 = 
{
"    -> Saved in: " $. pdrop 
bold_green "Exports directory" $. pdrop 10 10 emit emit reset_color pdrop
}
else
{
"    -> Saved in: " $. pdrop 
bold_red "Not saved" $. pdrop 10 10 emit emit reset_color pdrop
}
;