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

En VirtualBox, elegimos la opción de menú ***Archivo/Importar servicio virtualizado***. Elegimos el archivo ***Router-ubu.ova***, que hemos descargado previamente, y hacemos clic en ***Siguiente***. En ***Política de dirección MAC*** elegimos ***Incluir todas las direcciones de adaptador de red***. Repasamos el resto de la configuración y hacemos clic en ***Importar***.

En la lista de máquinas virtuales, seleccionamos ***Router-ubu*** y comprobamos la  configuración. Los valores más importantes son los siguientes:

* *General*: Es una VM con sistema operativo ***Ubuntu*** que está configurada para actuar de ***router*** entre sus dos interfaces de red (comentado en breve)
* *Sistema*: Tiene asignada ***1 GB RAM*** y ***1 core*** que es más que suficiente para realizar su cometido.
* *Red*: IMPORTANTE!!! Tenemos dos adaptadores. El primero de ellos está conectado a una ***Red interna*** de VirtualBox, que hemos llamado ***Laboratorio***. El segundo adaptador, deberá mover el tráfico hacia la red física en la que está conectado tu equipo, por eso es del tipo ***Adaptador de puente***

Es el momento de repasar la configuración correcta para los adaptadores de red de ***Router-ubu***. En VirtualBox, con la máquina virtual seleccionada, hacemos clic en el botón ***configuración***, y en el panel izquierdo del cuadro de diálogo, seleccionamos ***Red***. Aparecerán cuatro pestañas donde podemos configurar los adaptadores de red (esta VM usa dos tarjetas, por lo qu solo debemos fijarnos en las dos primeras pestañas)

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
```

y el password:
```
Pa55w.rd
```

Es el momento de comprobar si la máquina tiene conexión con Internet. (Nota: CTRL+C cuando responda el ping)
```
ping www.google.es
```

Con esto hemos terminado la importación y configuración del router.

## Ejercicio 4: Importación y configuracion de la VM KaliLinux2022_2

En VirtualBox, elegimos la opción de menú ***Archivo/Importar servicio virtualizado***. Elegimos el archivo ***KaliLinux2022_2.ova***, que hemos descargado previamente, y hacemos clic en ***Siguiente***.  En ***Política de dirección MAC*** elegimos ***Incluir todas las direcciones de adaptador de red***. Repasamos el resto de la configuración y hacemos clic en ***Importar***.

En la lista de máquinas virtuales, seleccionamos ***KaliLinux2022_2*** y comprobamos la  configuración. Los valores más importantes son los siguientes:

* *General*: Es una VM con sistema operativo ***Ubuntu*** que tiene instalada la suite ***Kali***

* *Sistema*: Tiene asignada ***4 GB RAM*** y ***3 cores*** 
* *Red*: Su tarjeta de red está conectada a la ***Red interna*** llamada ***Laboratorio***. 

En VirtualBox, con la máquina virtual seleccionada, hacemos clic en el botón ***configuración***, y en el panel izquierdo del cuadro de diálogo, seleccionamos ***Red***. Aparecerán cuatro pestañas donde podemos configurar los adaptadores de red (esta VM usa una sola tarjeta, por lo que solo debemos fijarnos en primera pestaña).

La pestaña llamada ***Adaptador 1*** es la que está asociada con la interfaz de red que conecta a red ***laboratorio***. Debemos asegurar que en ***Conectado a*** aparece ***Red Interna*** y, en el ***nombre*** de la red interna, aparece ***Laboratorio***. Si no fuera así, corregirlo convenientemente.

La tarjeta  tendrá configurada en el sistema operativo la dirección IP ***192.168.20.9*** (de la red de laboratorio).

Desplegamos el control ***Avanzadas***. En él podemos ver la ***dirección MAC*** que VirtualBox está asignando a esta intefaz. Aunque en principio podría darnos igual, para realizar de forma cómoda algunas de las prácticas del curso (ataques MitM y Spoofing), vamos a cambiarla a una predecible.

Modificamos los ***6 últimos*** digitos para que veamos claramente con qué IP estará asociada, así que editamos la dirección MAC de forma que sus 6 últimos dígitos queden así. (Nota: Los 6 primeros dígitos los dejamos tal cual)
```
090909
```

De esta forma, cuando veamos la MAC, por ejemplo, ***080027090909*** sabremos que estará asociada con la IP ***192.168.20.9***, porque el último byte es 1.

Guardamos la configuración haciendo clic en ***Aceptar***. 

Iniciamos la VM ***KaliLinux2022_2***.

Iniciamos sesión con el usuario:
```
antonio
```

y el password:
```
Pa55w.rd
```

Es el momento de comprobar si la máquina tiene conexión con Internet. (Nota: CTRL+C cuando responda el ping)
```
ping www.google.es
```

Con esto hemos terminado la importación y configuración de la máquina Kali.

## Ejercicio 5: Importación y configuracion de la VM Metasploitable3-ubu1404

En VirtualBox, elegimos la opción de menú ***Archivo/Importar servicio virtualizado***. Elegimos el archivo ***Metasploitable3-ubu1404.ova***, que hemos descargado previamente, y hacemos clic en ***Siguiente***.  En ***Política de dirección MAC*** elegimos ***Incluir todas las direcciones de adaptador de red***. Repasamos el resto de la configuración y hacemos clic en ***Importar***.

En la lista de máquinas virtuales, seleccionamos ***Metasploitable3-ubu1404*** y comprobamos la  configuración. Los valores más importantes son los siguientes:

* *General*: Es una VM con sistema operativo ***Ubuntu*** que tiene instalada una serie de aplicaciones y servicios con vulnerabilidades.

* *Sistema*: Tiene asignada ***2 GB RAM*** y ***2 cores*** 
* *Red*: Su primera tarjeta de red está conectada a la ***Red interna*** llamada ***Laboratorio***. La segunda interfaz de red está conectada a la ***red de host** y no vamos a usarla en estos laboratorios.

En VirtualBox, con la máquina virtual seleccionada, hacemos clic en el botón ***configuración***, y en el panel izquierdo del cuadro de diálogo, seleccionamos ***Red***. La pestaña llamada ***Adaptador 1*** es la que está asociada con la interfaz de red que conecta a red ***laboratorio***. Debemos asegurar que en ***Conectado a*** aparece ***Red Interna*** y, en el ***nombre*** de la red interna, aparece ***Laboratorio***. Si no fuera así, corregirlo convenientemente.

La tarjeta tiene configurada en el sistema operativo la dirección IP ***192.168.20.13*** (de la red de laboratorio).

Desplegamos el control ***Avanzadas***. En él podemos ver la ***dirección MAC*** que VirtualBox está asignando a esta intefaz. Aunque en principio podría darnos igual, para realizar de forma cómoda algunas de las prácticas del curso (ataques MitM y Spoofing), vamos a cambiarla a una predecible.

Modificamos los ***6 últimos*** digitos para que veamos claramente con qué IP estará asociada, así que editamos la dirección MAC de forma que sus 6 últimos dígitos queden así. (Nota: Los 6 primeros dígitos los dejamos tal cual)
```
131313
```

De esta forma, cuando veamos la MAC, por ejemplo, ***080027131313*** sabremos que estará asociada con la IP ***192.168.20.13***, porque el último byte es 1.

Guardamos la configuración haciendo clic en ***Aceptar***. 

Iniciamos la VM ***Metasploitable3-ubu1404***.

Iniciamos sesión con el usuario:
```
vagrant
```

y el password:
```
vagrant
```

La máquina presenta vulnerabilidades en el sistema operativo y en las aplicaciones instaladas. Para evitar que las actualizaciones cierren las vulnerabilidades, esta máquina virtual ***no tiene conexión*** con Internet. 

Con esto hemos terminado la importación y configuración de la máquina Metasploitable3.

Nota: ***Metasploitable3*** es un proyecto de Open Source de Rapid7. La documentación de la instalación de las VMs y de las vulnerabilidades presentes se puede encontrar en https://github.com/rapid7/metasploitable3

## Ejercicio 6: Importación y configuracion de la VM Metasploitable3-win2k8

En VirtualBox, elegimos la opción de menú ***Archivo/Importar servicio virtualizado***. Elegimos el archivo ***Metasploitable3-win2k8.ova***, que hemos descargado previamente, y hacemos clic en ***Siguiente***.  En ***Política de dirección MAC*** elegimos ***Incluir todas las direcciones de adaptador de red***. Repasamos el resto de la configuración y hacemos clic en ***Importar***.

En la lista de máquinas virtuales, seleccionamos ***Metasploitable3-win2k8*** y comprobamos la  configuración. Los valores más importantes son los siguientes:

* *General*: Es una VM con sistema operativo ***Windows Server 2008*** que tiene instalada una serie de aplicaciones y servicios con vulnerabilidades.

* *Sistema*: Tiene asignada ***4 GB RAM*** y ***2 cores*** 
* *Red*: Su primera tarjeta de red está conectada a la ***Red interna*** llamada ***Laboratorio***.

En VirtualBox, con la máquina virtual seleccionada, hacemos clic en el botón ***configuración***, y en el panel izquierdo del cuadro de diálogo, seleccionamos ***Red***. La pestaña llamada ***Adaptador 1*** es la que está asociada con la interfaz de red que conecta a red ***laboratorio***. Debemos asegurar que en ***Conectado a*** aparece ***Red Interna*** y, en el ***nombre*** de la red interna, aparece ***Laboratorio***. Si no fuera así, corregirlo convenientemente.

La tarjeta tiene configurada en el sistema operativo la dirección IP ***192.168.20.14*** (de la red de laboratorio).

Desplegamos el control ***Avanzadas***. En él podemos ver la ***dirección MAC*** que VirtualBox está asignando a esta intefaz. Aunque en principio podría darnos igual, para realizar de forma cómoda algunas de las prácticas del curso (ataques MitM y Spoofing), vamos a cambiarla a una predecible.

Modificamos los ***6 últimos*** digitos para que veamos claramente con qué IP estará asociada, así que editamos la dirección MAC de forma que sus 6 últimos dígitos queden así. (Nota: Los 6 primeros dígitos los dejamos tal cual)
```
141414
```

De esta forma, cuando veamos la MAC, por ejemplo, ***080027141414*** sabremos que estará asociada con la IP ***192.168.20.14***, porque el último byte es 1.

Guardamos la configuración haciendo clic en ***Aceptar***. 

Iniciamos la VM ***Metasploitable3-win2k8***.

Iniciamos sesión con el usuario:
```
vagrant
```

y el password:
```
vagrant
``` 

Con esto hemos terminado la importación y configuración de la máquina Metasploitable3.

Nota: ***Metasploitable3*** es un proyecto de Open Source de Rapid7. La documentación de la instalación de las VMs y de las vulnerabilidades presentes se puede encontrar en https://github.com/rapid7/metasploitable3

## Ejercicio 7: Importación y configuracion de la VM Windows 7.

En VirtualBox, elegimos la opción de menú ***Archivo/Importar servicio virtualizado***. Elegimos el archivo ***Windows 7.ova***, que hemos descargado previamente, y hacemos clic en ***Siguiente***.  En ***Política de dirección MAC*** elegimos ***Incluir todas las direcciones de adaptador de red***. Repasamos el resto de la configuración y hacemos clic en ***Importar***.

En la lista de máquinas virtuales, seleccionamos ***Windows 7 Ethical Hacking*** y comprobamos la  configuración. Los valores más importantes son los siguientes:

* *General*: Es una VM con sistema operativo ***Windows 7*** que tiene instalada una serie de aplicaciones y servicios con vulnerabilidades.

* *Sistema*: Tiene asignada ***2 GB RAM*** y ***1 core*** 
* *Red*: Su primera tarjeta de red está conectada a la ***Red interna*** llamada ***Laboratorio***.

En VirtualBox, con la máquina virtual seleccionada, hacemos clic en el botón ***configuración***, y en el panel izquierdo del cuadro de diálogo, seleccionamos ***Red***. La pestaña llamada ***Adaptador 1*** es la que está asociada con la interfaz de red que conecta a red ***laboratorio***. Debemos asegurar que en ***Conectado a*** aparece ***Red Interna*** y, en el ***nombre*** de la red interna, aparece ***Laboratorio***. Si no fuera así, corregirlo convenientemente.

La tarjeta tiene configurada en el sistema operativo la dirección IP ***192.168.20.12*** (de la red de laboratorio).

Desplegamos el control ***Avanzadas***. En él podemos ver la ***dirección MAC*** que VirtualBox está asignando a esta intefaz. Aunque en principio podría darnos igual, para realizar de forma cómoda algunas de las prácticas del curso (ataques MitM y Spoofing), vamos a cambiarla a una predecible.

Modificamos los ***6 últimos*** digitos para que veamos claramente con qué IP estará asociada, así que editamos la dirección MAC de forma que sus 6 últimos dígitos queden así. (Nota: Los 6 primeros dígitos los dejamos tal cual)
```
121212
```

De esta forma, cuando veamos la MAC, por ejemplo, ***080027121212*** sabremos que estará asociada con la IP ***192.168.20.12***, porque el último byte es 1.

Guardamos la configuración haciendo clic en ***Aceptar***. 

Iniciamos la VM ***Windows 7 Ethical Hacking***.

Iniciamos sesión con el usuario:
```
georgia
```

y el password:
```
Pa55w.rd
``` 

Con esto hemos terminado la importación y configuración de la máquina Windows 7.

## Ejercicio 8: Importación y configuracion de la VM Win11.

En VirtualBox, elegimos la opción de menú ***Archivo/Importar servicio virtualizado***. Elegimos el archivo ***Win11.ova***, que hemos descargado previamente, y hacemos clic en ***Siguiente***.  En ***Política de dirección MAC*** elegimos ***Incluir todas las direcciones de adaptador de red***. Repasamos el resto de la configuración y hacemos clic en ***Importar***.

En la lista de máquinas virtuales, seleccionamos ***Win11*** y comprobamos la  configuración. Los valores más importantes son los siguientes:

* *General*: Es una VM con sistema operativo ***Windows 11*** que tiene instalada una serie de aplicaciones.

* *Sistema*: Tiene asignada ***5 GB RAM*** y ***3 cores***. En función de la capacidad de tu hardware podrías bajarla a ***3 GB RAM*** y ***2 cores***.
* *Red*: Su primera tarjeta de red está conectada a la ***Red interna*** llamada ***Laboratorio***.

En VirtualBox, con la máquina virtual seleccionada, hacemos clic en el botón ***configuración***, y en el panel izquierdo del cuadro de diálogo, seleccionamos ***Red***. La pestaña llamada ***Adaptador 1*** es la que está asociada con la interfaz de red que conecta a red ***laboratorio***. Debemos asegurar que en ***Conectado a*** aparece ***Red Interna*** y, en el ***nombre*** de la red interna, aparece ***Laboratorio***. Si no fuera así, corregirlo convenientemente.

La tarjeta tiene configurada en el sistema operativo la dirección IP ***192.168.20.11*** (de la red de laboratorio).

Desplegamos el control ***Avanzadas***. En él podemos ver la ***dirección MAC*** que VirtualBox está asignando a esta intefaz. Aunque en principio podría darnos igual, para realizar de forma cómoda algunas de las prácticas del curso (ataques MitM y Spoofing), vamos a cambiarla a una predecible.

Modificamos los ***6 últimos*** digitos para que veamos claramente con qué IP estará asociada, así que editamos la dirección MAC de forma que sus 6 últimos dígitos queden así. (Nota: Los 6 primeros dígitos los dejamos tal cual)
```
111111
```

De esta forma, cuando veamos la MAC, por ejemplo, ***080027111111*** sabremos que estará asociada con la IP ***192.168.20.11***, porque el último byte es 1.

Guardamos la configuración haciendo clic en ***Aceptar***. 

Iniciamos la VM ***Win11***.

Iniciamos sesión con el usuario:
```
.\antonio
```

y el password:
```
Pa55w.rd
``` 

Con esto hemos terminado la importación y configuración de la máquina Windows 11.

## Ejercicio 9. Importación y configuracion de la VM Windows Server 2022 core.

En VirtualBox, elegimos la opción de menú ***Archivo/Importar servicio virtualizado***. Elegimos el archivo ***WS2022_DC_Server_Core.ova***, que hemos descargado previamente, y hacemos clic en ***Siguiente***.  En ***Política de dirección MAC*** elegimos ***Incluir todas las direcciones de adaptador de red***. Repasamos el resto de la configuración y hacemos clic en ***Importar***.

En la lista de máquinas virtuales, seleccionamos ***WS2022_DC_Server_Core*** y comprobamos la  configuración. Los valores más importantes son los siguientes:

* *General*: Es una VM con sistema operativo ***Windows Server 2022*** que tiene desplegado el rol de ***Controlador de dominio***.

* *Sistema*: Tiene asignada ***4 GB RAM*** y ***3 cores***. En función de la capacidad de tu hardware podrías bajarla a ***3 GB RAM*** y ***2 cores***.
* *Red*: Su primera tarjeta de red está conectada a la ***Red interna*** llamada ***Laboratorio***.

En VirtualBox, con la máquina virtual seleccionada, hacemos clic en el botón ***configuración***, y en el panel izquierdo del cuadro de diálogo, seleccionamos ***Red***. La pestaña llamada ***Adaptador 1*** es la que está asociada con la interfaz de red que conecta a red ***laboratorio***. Debemos asegurar que en ***Conectado a*** aparece ***Red Interna*** y, en el ***nombre*** de la red interna, aparece ***Laboratorio***. Si no fuera así, corregirlo convenientemente.

La tarjeta tiene configurada en el sistema operativo la dirección IP ***192.168.20.10*** (de la red de laboratorio).

Desplegamos el control ***Avanzadas***. En él podemos ver la ***dirección MAC*** que VirtualBox está asignando a esta intefaz. Aunque en principio podría darnos igual, para realizar de forma cómoda algunas de las prácticas del curso (ataques MitM y Spoofing), vamos a cambiarla a una predecible.

Modificamos los ***6 últimos*** digitos para que veamos claramente con qué IP estará asociada, así que editamos la dirección MAC de forma que sus 6 últimos dígitos queden así. (Nota: Los 6 primeros dígitos los dejamos tal cual)
```
101010
```

De esta forma, cuando veamos la MAC, por ejemplo, ***080027101010*** sabremos que estará asociada con la IP ***192.168.20.10***, porque el último byte es 1.

Guardamos la configuración haciendo clic en ***Aceptar***. 

Iniciamos la VM ***WS2022_DC_Server_Core***.

Iniciamos sesión con el usuario:
```
XYZ\administrator
```

y el password:
```
Pa55w.rd
``` 

Con esto hemos terminado la importación y configuración de la máquina Windows 2022 Server core.

## Ejercicio 10. Importación y configuracion de la VM ubu_srv_01.

En VirtualBox, elegimos la opción de menú ***Archivo/Importar servicio virtualizado***. Elegimos el archivo ***ubu_srv_01.ova***, que hemos descargado previamente, y hacemos clic en ***Siguiente***.  En ***Política de dirección MAC*** elegimos ***Incluir todas las direcciones de adaptador de red***. Repasamos el resto de la configuración y hacemos clic en ***Importar***.

En la lista de máquinas virtuales, seleccionamos ***ubu_srv_01*** y comprobamos la  configuración. Los valores más importantes son los siguientes:

* *General*: Es una VM con sistema operativo ***Ubuntu Server 20.04***.

* *Sistema*: Tiene asignada ***3 GB RAM*** y ***1 cores***. En función de la capacidad de tu hardware podrías bajarla a ***1 GB RAM***.
* *Red*: Su primera tarjeta de red está conectada a la ***Red interna*** llamada ***Laboratorio***.

En VirtualBox, con la máquina virtual seleccionada, hacemos clic en el botón ***configuración***, y en el panel izquierdo del cuadro de diálogo, seleccionamos ***Red***. La pestaña llamada ***Adaptador 1*** es la que está asociada con la interfaz de red que conecta a red ***laboratorio***. Debemos asegurar que en ***Conectado a*** aparece ***Red Interna*** y, en el ***nombre*** de la red interna, aparece ***Laboratorio***. Si no fuera así, corregirlo convenientemente.

La tarjeta tiene configurada en el sistema operativo la dirección IP ***192.168.20.60*** (de la red de laboratorio).


Guardamos la configuración haciendo clic en ***Aceptar***. 

Iniciamos la VM ***ubu_srv_01***.

Iniciamos sesión con el usuario:
```
antonio
```

y el password:
```
Pa55w.rd
``` 

Con esto hemos terminado la importación y configuración de la máquina Ubu_srv_01.

## Ejercicio 11: Clonado del repositorio de GitHub.

Algunos laboratorios requieren tener ciertos archivos presentes en la máquina virtual. La forma más efectiva de conseguirlo es clonar el repositorio en dicha máquina virtual.

Abre una terminal y asegurate que el comando ***git*** está presente.
Nota: Si no estuviera instalado, descárgalo e instálalo.
```
git --version
```

Creamos un directorio en el directorio ***Home*** del usuario.

Si la máquina es Windows...
```
mkdir $HOME\eHacking_LABS

cd $HOMW\eHacking_LABS

git clone https://github.com/antsala/eHacking_LABS.git
```

Si la máquina es Linux...
```
mkdir ~/eHacking_LABS

cd ~/eHacking_LABS

git clone https://github.com/antsala/eHacking_LABS.git
```