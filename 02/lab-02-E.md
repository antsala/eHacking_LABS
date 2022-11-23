# Realizar Footprinting usando Whois y DNS.

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Win11***.



## Ejercicio 1: Consulta a la base de datos Whois.

En el inicio de la fase de reconocimiento, el actor de amenaza esta completamente a ciegas en relación al conocimiento de la infraestructura del objetivo, así que suele acudir a la base de datos ***Whois*** para comenzar a investigar la infraestrutura pública de la víctima.

Un hacker ético usa estas misma herramientas y simulando ser el actor de amenaza, intenta obtener esta información. Cuando al hacker ético no se le suministra ningún tipo de información sobre la infraestructura de su cliente, el tipo de investigación que realiza se le suele llamar de  ***Caja negra*** (***black box***).

***Whois*** es un protocolo que permite hacer consultas a las bases de datos públicas que almacenan información sobre ***dominios***, ***bloques de direcciones IPs***, y ***sistemas autónomos***. Estas consultas también muestran información ***nombre y apellidos***, ***emails***, ***razón social*** de los propietarios del dominio (generalmente el contacto técnico y el propietario) que aportan datos importantes.

Existen muchas herramientas para interactuar con las bases de datos de Whois que son mantenidas por los ***Regional Internet Registries (RIRs)***, algunas de ellas con línea de comando, pero lo más sencillo es usar una página web. 

En la máquina ***Kali***, abre el navegador y conéctate a la siguiente URL.
```
https://whois.domaintools.com/
```

En la barra de búsqueda escribe el nombre de dominio de un host de tu elección. Estudia y localiza la información técnica y personal que podría ser de interés.

Como segundo ejercicio te proponemos que extraigas información sobre una IP pública de tu elección. Estudia el resultado.

Si no conoces qué es RIR, te recomendamos leer este artículo: https://es.wikipedia.org/wiki/Registro_Regional_de_Internet.

## Ejercicio 2: Reconocimiento por medio de registros DNS.

La misión principal del ***Servicio de Nombres de Dominio (DNS)*** es traducir un nombre de dominio a una dirección IP. 

Son muchas las ventajas que las herramientas de reconocimiento de DNS brindan al actor de la amenaza, y sin duda, las utilizará.

Interactuar con el servicio de nombres tiene dos aproximaciones. La primera de ellas sería consultando los registros públicos, que suelen estar suficientemente protegidos para no presentar un problema de seguridad. En la segunda, una vez que el hacker se ha infiltrado en la red local de la víctima, puede intentar una transferencia de zona (que normalmente no va a ser posible) o utilizar técnicas indirectas para conseguir el mismo objetivo. Como resultado, el actor de la amenaza podría conseguir un listado con todos (o una gran mayoría) los equipos de la red local con sus respectivas direcciones IP.

Saber interactuar con DNS permitirá extraer información de calidad sobre la víctima, por ejemplo saber cuáles son los servidores de nombres  de la víctima, permitirá al atacante realizar posteriormente ataques a la resolución de nombres, como ***spoofing***, ***transferencia de zona***, ***hijacking***, ***DDoS***, etc.

En una terminal de la máquina ***Kali***, escribimos.
```
dig
```

Aunque existen muchas herramientas para interactuar con los servidores DNS, hemos elegido ***dig*** por estar presente en los sistemas Linux.

La salida del comando muestra los ***root servers*** o servidores raíces y el servidor configurado para la resolución, que es ***8.8.8.8*** o Google.

Vamos a buscar la dirección IP del servidor web. 
```
dig www.certifiedhacker.com a
```

En la sección de salida se puede localizar la IP. Si prefieres, puedes optar por mostrar una salida recortada, que sería de la siguiente foma.
```
dig www.certifiedhacker.com a +short
```

***8.8.8.8*** no es el servidor que lleva la zona. Procedemos a descubrir quienes son.
Esto lo podemos conseguir diciéndole a la herramienta que estamos interesados en conocer los registros de tipo ***NS***.
```
dig certifiedhacker.com ns +short
```

Para interactuar directamente con uno de estos servidores, se lo indicamos a la herramienta. Como podrás comprobar en la salida del siguiente comando, es el servidor DNS que queremos el que devuelve los registros.
```
dig @ns1.bluehost.com www.certifiedhacker.com a
```

Se puede extraer mucha información en los registros los servidores públicos de la zona. Lee este artículo: https://www.hostinger.es/tutoriales/comando-dig-linux y practica con el dominio de tu interés.

Si prefieres comodidad a la hora de consultar una zona, puedes apoyartes en sitios de Internet especializados. En una ventana del navegador, conéctate a la siguiente URL.
```
http://www.kloth.net/services/dig.php
```

Rellena el formulario y consulta el mismo dominio de antes.
(Nota: Puedes intentar ***transferencias de zona***, que no deberían funcionar.)

En otra pestaña del navegador, conéctate a esta URL.
(Nota: Podrás ver un montón de servicios relacionados.)
```
http://www.kloth.net/services/
```

Conéctate a la siguiente URL. Investiga las herramientas disponibles.
```
https://www.yougetsignal.com/
```

De las herramientas anteriores, elige ***Reverse IP Domain Check*** e introduce el siguiente dominio:
```
certifiedhacker.com
```

Como resultados podrás comprobar los dominios hospedados en la IP ***162.241.216.11***.
(Nota: Esta IP Podría ser diferente a la que mostramos.)

Ahora vamos a utilizar una herramienta muy conocida en el mundillo, se trata de ***dnsrecon***.

Generalmente las organizaciones piden bloques de direcciones IPs para sus servicios públicos. Una técnica muy habitual consiste en reconocer el conjunto de IPs adyacentes a la que ya hemos descubierto. Su finalidad es la de descubrir servicios en Internet que pudieran no ser de uso público, como servidores VPN.

En una terminal de la máquina ***Kali*** escribimos el siguiente comando.
(Nota: Estamos reconociendo una red de clase C en la que se encuentra la IP del servidor web.)
```
dnsrecon -r 162.241.216.0-162.241.216.255
```

Al hacer una búsqueda inversa, estamos resolviendo las IPs a nombres de dominio, que facilita la localización de IPs relacionadas con la organización objetivo, por ejemplo todas las que muestran el nombre ***bluehost.com*** en el dominio.

***ACTIVIDAD***

Usando las técnicas y herramientas descritas en este ejercicio, extrae toda la información DNS, IP y personal de la organización que estimes oportuna.

***FIN ACTIVIDAD***

## Ejercicio 3: Reconocimiento por medio del protocolo ICMP

Por todos es conocido que el protocolo ***ICMP***, que usa la herramienta ***ping***, sirve para reconocer la existencia de un host concreto. Este protocolo envía tramas hacia el destino que, cuando es alcanzado, responde en consecuencia.

En la máquina ***Win11***, abrimos una ***Terminal de comandos***. En ella escribimos el siguiente comando y estudiamos la salida.
```
ping www.certifiedhacker.com
```

La herramienta envía tramas de 32 bytes hacia el destino con la esperanza de que éste las reciba y, responda en consecuencia. El protocolo IP subyacente va encaminando los datagramas ICMP por los diversos routers que forman en circuito. Para evitar los lazos, que harían que una datagrama viajara eternamente por Internet, se utiliza en campo ***TTL***.

El ***TTL*** o ***Time To Live*** es un valor numérico que se decrementa en una unidad cuando el datagrama atraviesa un router. De esta forma se consigue que los datagramas no viajen indefinidamente, pues cuando el valor de TTL llega a cero, el router que lo recibe ya no reenvía ese datagrama y, en consecuencia, desaparece.

Pues bien, tenemos herramientas que hace un uso inteligente del campo ***TTL***. Su objetivo es mostrar la ruta completa que une al origen con el destino. Para ello se manda hacia el destino un datagrama con un valor de ***TTL=1***, que provocará que responda el primer router, quedándo registrada la IP del mismo. A continuación, la herramienta envia otros datagramas incrementando en una unidad el valor del TTL. En consecuencia podemos obtener las IPs de todos los routers que participan en la comunicación. Esta información es muy importante para el actor de la amenaza, pues obtiene información de los proveedores de Internet, y la arquitectura de red de la víctima.
Nota: Algunos routers no responden al ICMP, y se obtendrá un error de tiempo de espera, que será representado por un asterisco.

La herramienta por excelencia es ***tracert***. En la Terminal de comandos escribimos.
```
https://www.yougetsignal.com/tools/visual-tracert/
```

Herramientas para realizar el trazado existen muchas. Abre tu navegador y copia la siguiente URL en la barra de direcciones. 
(Nota: La aplicación que vamos a instalar requiere Java.)
```
https://download.oracle.com/java/18/latest/jdk-18_windows-x64_bin.exe
```

una vez instalado Java, vamos a descargar ***Open Visual Trace***, así que en el navegador, copia la siguiente URL.
```
https://sourceforge.net/projects/openvisualtrace/
```

***ACTIVIDAD***

Espera a que se descargue la app e instálala. Cuando la abras, traza la ruta al host de tu elección.

***FIN ACTIVIDAD***

***FIN DEL LABORATORIO***