# Realizar Footprinting por medio de redes sociales.

Requisitos:
1. Máquina ***Kali Linux***.

En este curso de Ethical Hacking aprenderemos que la estrategia de ataque más propicia para el actor de la amenaza es, sin duda, la ingeniería social.

Obtener pues información personal de los empleados y cargos de una organización es ***fundamental***, siendo las redes sociales un aliado indiscutible para este tipo de actores.

El uso (y abuso) de exposición de datos y actividades personales en estas redes es una fuente de valor incalculable para los ciberdelincuentes. En estos casos, la víctima no solo comparte información básica, sino además otras de valor añadido como su número de teléfono, DNI, o domicilio.

En este ejercicio aprenderemos a usar herramientas que interactúan con redes sociales y extraen información de calidad para el actor de la amenaza.


## Extraer información desde LinkedIn

LinkedIn se utiliza habitualmente para realizar ofertas de trabajo que son atendidas por aquellas personas que lo demandan.

En todo momento, tu red de contacto, ya está suministrando información de valor para el actor de la amenaza. Solemos tener compañeros de trabajo, clientes, proveedores, competidores, etc. Esta información es de dominio público y las herramientas de recolección no tienen ningún problema en extraer esta información.

Por otro lado, ciertos datos personales están protegidos por la propia plaforma: DNI, domicilio, teléfono, etc. Una técnica de hackeo muy sencilla es contratar una cuenta de empresa y publicar una oferta de empleo (obviamente falsa). 

En el colectivo de IT, aún no teniendo intención de abandonar tu puesto de trabajo, suele ser interesante acceder a ciertas ofertas de empleo, aunque solo sea por comparar que te ofrecen y qué tienes en tu puesto actual. De esta manera, es así de sencillo obtener datos personales valiosos sobre personal cualificado en la organización que se pretende atacar.

Vamos a volver a utilizar ***theHarverter*** pero esta vez nos centramos en ***LinkedIn***. En una terminal de la máquina de ***Kali***, escribimos.
```
theHarvester -d <Pon_aquí_el_nombre_de_una_empresa> -l 200 -b linkedin
```
