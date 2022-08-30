# Realizar Footprinting usando motores de búsqueda.

Requisitos:
1. Máquina ***Kali Linux***.

La mejor fuente de información sobre la víctima la encontraremos interactuando con los servicios existentes en Internet que todos conocemos: Redes socales, servicios de búsquedas de personas, webs de empleo, foros, etc...

En este ejercicio aprenderemos a usar herramientas que interactúan con estos servicios para obtener información de reconocimiento.

## Localizar dominios de la víctima

En https://www.netcraft.com/tools/ podemos "consultar" que es lo que la web sabe sobre el dominio de la victima. Este siempre es un buen punto de partida en la etapa inicial. 

En ***What's that site running*** ponemos una URL de nuestra elección. Al hacer clic en el botón de la derecha, obtendremos un informa interesante. Estudiarlo.

Haciendo clic en ***Domain*** podemos ver los subdominios registrados.

## Localizar información sobre personas usando buscadores.

En https://peekyou.com puedes localizar información sobre una persona. Este tipo de webs es muy común, aunque la mayoría requieres subscripción para obtener los resultados.

Prueba a localizar información sobre tu "víctima". También es recomendable leer este artículo https://www.genbeta.com/a-fondo/buscas-a-alguien-en-internet-estas-14-webs-te-ayudaran-a-encontrarlo donde aparecen sitios web similares.


## - Localizar direcciones de correo electrónico.

Sin duda alguna obtener un listado con las direcciones de correo corporativos de los miembros de la organización víctima, es algo que va buscando el hacker desde el primer momento.

El phishing (spear) es el vector de ataque más importante en la actualidad, así que en esta fase de recolección, es un objetivo que se busca claramente.

Existen muchas herramientas que permiten automatizar la recogida de este tipo de información, pero ***The Harvester (El recolector)*** es una de las más conocidas y utilizadas.

Abrimos una terminal en la máquina ***Kali***, y ejecutamos el siguiente comando.
```
theHarvester
```

