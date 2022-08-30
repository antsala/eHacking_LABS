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


## Localizar direcciones de correo electrónico.

Sin duda alguna obtener un listado con las direcciones de correo corporativos de los miembros de la organización víctima, es algo que va buscando el hacker desde el primer momento.

El phishing (spear) es el vector de ataque más importante en la actualidad, así que en esta fase de recolección, es un objetivo que se busca claramente.

Existen muchas herramientas que permiten automatizar la recogida de este tipo de información, pero ***The Harvester (El recolector)*** es una de las más conocidas y utilizadas.

Abrimos una terminal en la máquina ***Kali***, y ejecutamos el siguiente comando.
```
theHarvester
```

La sintaxis es muy sencilla. 
* *-d <dominio>* permite poner el ***dominio*** corporativo cuyas direcciones de correo electrónico se desea recolectar.
* *-l <max>* se usa para ***limitar*** la salida. Es el número máximo de líneas que mostrará la salida.
* *-b <buscador>* sirve para indicar a la herramienta qué ***motor de busqueda*** deseamos utilizar: Google, Bing, baidu, DuckDuckGo, etc.

```
theHarvester -d <pon_aquí_un_dominio> -l 200 -b google
```

## Localizar recursos en la Dark Web.

Sin duda habrás oído hablar del la Internet Oscura o ***Dark Web***. Una colección de sitios web en la que debemos ser muy precavidos. Todo lo que se considera ilegal tiene cabida aquí, incluído contenidos que pueden herir la sensibilidad de cualquiera de nosotros.

Un sitio web de la Dark web sigue siendo un sitio web, es decir, no hay nada en especial que lo diferencie de los sitios web convencionales, a excepción de que no va a estar anunciado por un registro de recurso DNS de tipo A o CNAME.

En consecuencia, para acceder a los sitios de la Internet Oscura debemos conocer su ***Dirección IP***. Como alternativa, se ha desarrollado una resolución de nombres muy característica, donde el dominio de primer nivel es ***onion***. Obviamente fuera del estándar DNS.

Para poder acceder a estos dominios "especiales" se necesita usar un navegador también especial. Es el ***Navegador Tor***, así que lo que vamos a hacer es instalarlo en la máquina Kali.
```
sudo apt update
```
```
sudo apt install -y tor torbrowser-launcher
```

