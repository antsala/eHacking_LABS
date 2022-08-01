# Configuración del entorno de laboratorio basado en VirtualBox.

## Ejercicio 1: Instalación de VirtualBox para Windows.

Aunque existen muchos hipervisores para realizar las prácticas, en este curso hemos elegido ***VirtualBox*** de Oracle. Los procedimientos que se describen vienen referidos a este hipervisor.

Para instalar VirtualBox en Windows, debemos seguir los pasos indicados en: https://www.virtualbox.org/

Se recomienda crear una carpeta para ubicar los archivos de las máquinas virtuales. Desde la terminal de Windows ejecutamos:
```
mkdir C:\VMs
```

También es conveniente indicar a VirtualBox esta carpeta como repositorio de las nuevas VMs que se crearán. Para ello, en la herramienta de administración de VirtualBox, elegimos ***Archivo/Preferencias***. En el cuadro de texto ***Carpeta predeterminada de máquinas***, escribimos:
```
C:\VMs
```

Hacemos clic en ***Aceptar***

## Ejercicio 2: Descarga de las OVAs de las VMs.

TOTE, por hacer. 
En esta URL puedes descargar las OVAs de las VMS. Estas son:

* *router-ubu*: Su misión es la de servir de gateway entre la red de laboratorios y el entorno físico real.


## Ejercicio 3: Importación y configuracion de la VM ***Router-ubu***

En VirtualBox, elegimos la opción de menú ***Archivo/Importar servicio virtualizado***. Elegimos el archivo ***Router-ubu.ova***, que hemos descargado previamente, y hacemos clic en ***Siguiente***. Repasamos la configuración y hacemos clic en ***Importar***.

En la lista de máquinas virtuales, seleccionamos ***Router-ubu*** y comprobamos la  configuración. Los valores más importantes son los siguientes:

* *General*: Es una VM con sistema operativo ***Ubuntu*** que está configurada para actuar de ***router*** entre sus dos interfaces de red (comentado en breve)
* *Sistema*: Tiene asignada ***1 GB RAM*** y ***1 core*** que es más que suficiente para realizar su cometido.
* *Red*: IMPORTANTE!!! Tenemos dos adaptadores. El primero de ellos está conectado a una ***Red interna*** de VirtualBox, que hemos llamado ***Laboratorio***. El segundo adaptador, deberá mover el tráfico hacia la red física en la que está conectado tu equipo, por eso es del tipo ***Adaptador de puente***

Es el momento de repasar la configuración correcta para los adaptadores de red de ***Router-ubu***. En VirtualBox, con la máquina virtual seleccionada, hacemos clic en el botón ***configuración***, y en el panel izquierdo del cuadro de diálogo, seleccionamos ***Red***. Aparecerán cuatro pestañas donde podemos configurar los adaptadores de red (esta VM usa dos tarjetas, por lo qu solo debemos fijarnos en las dos primeras pesteñas)

La primera pestaña, llamada ***Adaptador 1*** es la que está asociada con la interfaz de red que conecta este router con la red ***laboratorio***. Debemos asegurar que en ***Conectado a*** aparece ***Red Interna*** y, en el ***nombre*** de la red interna, aparece ***Laboratorio***. Si no fuera así, corregirlo convenientemente.

La tarjeta "interna" tendrá configurada en el sistema operativo la dirección IP ***192.168.20.1*** (de la red de laboratorio), que será la puerta de enlace de todas las VMs que vamos a utilizar.

Desplegamos el control ***Avanzadas***. En él podemos ver la ***dirección MAC*** que VirtualBox está asignando a esta intefaz. Aunque en principio podría darnos igual, para realizar de forma cómoda algunas de las prácticas del curso (ataques MitM y Spoofing), vamos a cambiarla a una predecible.

Como bien sabemos, de los 12 dígitos hexadecimales, los 6 primeros identifican al fabricante, mientras que los ***6 restantes*** a la interfaz. Modificamos los ***6 últimos*** digitos para que veamos claramente con qué IP estará asociada, así que editamos la dirección MAC de forma que sus 6 últimos dígitos queden así. (Nota: Los 6 primeros dígitos los dejamos tal cual)
```
010101
```

De esta forma, cuando veamos la MAC, por ejemplo, ***080027010101*** sabremos que estará asociada con la IP ***192.168.20.1***, porque el último byte es 1.

Ahora seleccionamos la segunda pestaña, llamada ***Adaptador 2***. Ahí tendrás que asegurarte que aparece la configuración ***Adaptador de puente*** en ***Conectado a*** y que has seleccionado en ***Nombre*** la interfaz de red ***FÍSICA*** mediante la cual tu equipo tiene conexión a la red local. Para esta interfaz "externa", no necesitamos tocar su MAC.

Guardamos la configuración haciendo clic en ***Aceptar***. 

Iniciamos la VM ***Router-ubu***.

Iniciamos sesión con el usuario:
```
antonio
````

y el password:
```
Pa55w.rd
```

Es el momento de comprobar si la máquina tiene conexión con Internet. (Nota: CTRL+C cuando responda el ping)
```
ping www.google.es
````

Con esto hemos terminado la importación y configuración del router.


