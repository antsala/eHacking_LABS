# Realizar Footprinting usando Whois y DNS.

Requisitos:
1. Máquina ***Kali Linux***.



## Consulta a la base de datos Whois.

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

## Reconocimiento por medio de registros DNS.

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
Nota: Puedes intentar ***transferencias de zona***, que no deberían funcionar.

En otra pestaña del navegador, conéctate a esta URL.
Nota: Podrás ver un montón de servicios relacionados.
```
http://www.kloth.net/services/
```

Conéctate a la siguiente URL. Investiga las herramiientas disponibles.
```
https://www.yougetsignal.com/
```

pág 97




