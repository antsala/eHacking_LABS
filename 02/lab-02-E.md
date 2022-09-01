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
nslookup
```

Aunque existen muchas herramientas para interactuar con los servidores DNS, hemos elegido ***nslookup*** por estar presente también en Windows.

Elige un dominio de tu elección. Lo primero que vamos a buscar es la dirección IP del servidor web. En el prompt de ***nslookup*** escribimos.
```
set type=a
www.certifiedhacker.com
```

Como puedes observar, la respuesta es ***Non-Authoritative***, que quiere decir que el nombre ha sido resuelto por un servidor DNS que no es el que lleva la zona. En consecuencia, suele ser importante conocer cuales son los servidores que realmente llevan la zona. 

Esto lo podemos conseguir diciéndole a la herramienta que estamos interesados en conocer los registros de tipo ***NS***.
```
set type=ns
certifiedhacker.com
```


