# ForEmb Braille
**ⓘ Acerca de este apartado:** <br />

ForEmb Braille es una extensión de palabras que agregan a foremb la capacidad de trabajar con traducciónes a braille, esta idea es propuesta como proyecto de la matería de Traductores de Lenguajes I.

## ¿Qué es lo que se implementa aquí?

**ⓘ Palabras de Códigos de Escape:** <br />

* **bold** hace la letra negritas.
* **bold_green** hace la letra de la terminal verde y negritas.
* **bold_red** hace la letra de la terminal roja y negritas.
* **reset_color** hace que la letra vuelva a la normalidad.

**ⓘ Variables de Configuración:** <br />

En el archivo `includes/braille.leo` encontraremos variables que nos ayudarán a controlar procesos dentro de otras palabras agregadas en el lenguaje, aquí listaré cada una de ellas y las palabras relacionadas a las mismas.

* **file_name** es una variable de tipo string que guarda la ruta del archivo donde guardamos la traducción del texto original a braille.
     - **get_file_name** funciona como un getter del valor de la variable.
* **directory_flag** es una variable de tipo entero que guarda una bandera que condiciona el saber si el directorio se creo en la ultima ejecución de la traducción, se inicializa en 0.
     - **get_directory_flag** funciona como un getter del valor de la bandera.
     - **activate_directory_flag** funciona como un activador de la bandera, pasando su valor a 1.
* **file_flag** es una variable de tipo entero que guarda una bandera que detecta si el usuario quiere guardar el resultado de la traducción en un archivo.
     - **get_file_flag** funciona como un getter del valor de la bandera
     - **activate_file_flag** funciona como un activador de la bandera, pasando su valor a 1.

**ⓘ Relacionado a la Terminal:** <br />

* **os:save_braille** es una palabra nueva que pide el input del usuario para saber si quiere guardar el resultado de la traducción en un archivo, si el usuario elige guardar el contenido en un archivo, se llama la palabra *activate_file_flag*.
* **$make_directory** esta palabra toma como parametro la celda en la cima de la pila de apuntadores, siendo este el nombre del directorio que se quiere crear, comprueba si este existe, si no es el caso, crea el directorio por medio de `mkdir` y *file:run* además llama la palabra *activate_directory_flag* para indicar que se creo el directorio.
* **$add_date** es una palabra que se llama al final de cada conversión, usa el comando `date` y el operador `>>` para guardar la fecha en el archivo de traducciones.

**ⓘ Relacionado a Archivos:** <br />

* **$to_braille** es la palabra principal de la extensión, acepta como parametro la palabra que queremos convertir a braille.
* **braille_results** es una palabra que muestra los resultados de la traducción asi como la condicion al usuario si quiere guardar el contenido en un archivo.
* **end_braille** es una palabra que muestra en pantalla el tamaño de la palabra ingresada, asi como los estados del archivo y directorio.
* **emit_braille** es la palabra encargada de ir mostrando letra por letra en braille.
* **$clear_braille** borra el contenido del archivo.

**ⓘ Scripts:** <br />

* **$braille_content** como foremb actualmente no tiene soporte para lectura de archivos, se implemento el script **show_braille.sh**, que nos permite consultar lo que hay en el archivo usando bash.