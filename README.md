# Guía de Foremb
**ⓘ Acerca de este repositorio:** <br />

Foremb es un interprete creado a partir del lenguaje [Forth](https://en.wikipedia.org/wiki/Forth_(programming_language)) que es un lenguaje basado en pilas, el interprete fue creado por el [Dr. Edwin Christian Becerra Alvarez](https://udg.mx/es/investigacion/directorio/edwin-christian-becerra-alvarez), así como el [Dr. Juan José Raygoza Panduro](http://www.cucei.udg.mx/doctorados/electronica/es/directorio/juan-jose-raygoza-panduro) de la [Universidad de Guadalajara](https://udg.mx/).

**ⓘ Importante:** <br />

* Para usar foremb, necesitamos una instalación de cualqueir distribución GNU Linux basada en [Debian](https://www.debian.org/index.es.html) o en 
[Ubuntu](https://ubuntu.com/) directamente, personalmente recomiendo [Linux Mint](https://linuxmint.com/).
* Necesitamos tener el siguiente directorio creado en nuestra carpeta raíz `/usr/bin/env`.
* Una vez instalado, podemos usar foremb como un interprete desde cualquier terminal usando `CTRL + T` y escribiendo `foremb`, o también crear un script
bastante parecido a un bash, si queremos hacer esto ultimo, la primera línea del script debe contener: `#!/usr/bin/env foremb` para funcionar correctamente.
* Los ejemplos de este repositorio usan archivos con extesión `.leo` para guardar los scripts, para que tu seas capaz de ejecutarlos debes darle permisos al
archivo de la siguiente manera: `chmod 750 <archivo.leo>`.

**ⓘ Instalación:** <br />

Para instalar este interprete debiste haber cumplido con los requisitos antes mencionados, ahora, en una terminal de Linux, clona el repositorio oficial de foremb, ingresa a la carpeta que genera, da permisos al archivo `.sh` y ejecutalo.
```
cd && git cd && git clone https://github.com/labcibernetica/ForEmb && cd interpreter
chmod a+rwx foremb.debian-setup.sh
./foremb.debian-setup.sh
```
Si por alguna razón esto no funciono, puedes intentar con los siguientes comandos:
```
cd && git cd && git clone https://github.com/labcibernetica/ForEmb && cd interpreter
sudo bash foremb-setup.sh
```

**ⓘ Contenido:** <br />
* Pila de Datos (Operaciones con números, con signo y sin signo así como símbolos).
* Palabras de Saltos (Codigo no secuencial).
* Ciclos (Repetir porciones de código).
* Controles de Flujo (Secuencial y selectivo).
* Diccionarios (Creación de nuevas palabras reservadas).
