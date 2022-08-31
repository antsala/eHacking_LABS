# Realizar Footprinting activo de sitios web.

Requisitos:
1. Máquina ***Kali Linux***.

El footprinting de sitios web es una de las técnicas más utilizadas por el actor de la amenaza a la hora de localizar posibles vulnerabilidades en los servidores.

Mediante técnicas OSINT es muy sencillo extraer la siguiente información:

* *Nombre de dominio*.
* *Contacto técnico*: Datos personales de la persona que ha registrado el dominio*.
* *Detalles del Sistema Operativo*.
* *Conjunto de direcciones IPs*.
* *Correos electrónicos*.

Por supuesto que existen herraimentas mucho más avanzadas, pero estas serán tratadas posteriormente en este curso.


## Recolectar información sobre sitio web objetivo.

Existen innumerables págias webs especializadas en mostrar información del sitio web objetivo. 

En la máquina ***Kali***, abrimos en navegador y conectamos con la siguiente URL.
```
https://website.informer.com
````

Cuando cargue la web, en el cuadro de texto de búsqueda, escribe el dominio del sitio web de tu interés y haz clic en el botón ***Search***.

Estudia la información que ofrece la página y realiza las siguientes actividades:

* *Teléfono del registrador*. Localiza el número de teléfono del registrador del dominio. Haz una consulta a Google buscando empresas que tengan este número de teléfono.
* *Contacto técnico*. Localiza información sobre la persona que ha registrado el dominio. Obtén su nombre y apellidos y con ellos, usa herramientas como ***Sherlock*** para ver qué descubres.
* *Geolicalización*. Si es el caso, geolocaliza las instalaciones de la organización asociada a este registro DNS.

Como decíamos existen multitud de sitios que ofrecen este tipo de información. Para localizarlos escribe en la barra de dirección del navegador, la siguiente URL.
```
https://www.similarweb.com
```

A continuación, en el cuadro de búsqueda, escribe
```
https://website.informer.com
```



