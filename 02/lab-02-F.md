# Otras herramientas de reconocimiento.

Requisitos:
1. Máquina ***Kali Linux***.
2. Máquina ***Win11***.

Herramientas de reconocimiento tenemos por doquier: Buenas, malas, gratuitas, de pago... El objetivo de este laboratorio es aprender a usar algunas de las más conocidas y útiles.

## Recon-ng

En una terminal de comandos de la máquina ***Kali*** escribimos.
Nota: Aparecerá la inferfaz de la herramienta y un prompt que nos invita a interactuar con ella. 
```
recon-ng
```

Vamos a proceder a instalar en la herramienta todos los módulo disponibls hasta el momento. En el prompt escribimos.
Nota: Se presentan errores en algunos módulos indicando que la clave no está disponible.
```
marketplace install all
```

Para visualizar los módulos instalados, ejecutamos el siguiente comando.
```
marketplace search
```

En el listado, nos fijamos en la columna ***K***, que indica los módulos que deben tener instalada una clave. Se corresponde con los errores que hemos obtenido anteriormente. La razon es que ***recon-ng*** es una aplicación de pago y debemos adquirir las claves para poder usar los módulos más avanzados (en este curso eso no es importante)

Recomendamos realizar una lectura detenida sobre todos los módulos de reconocimiento existentes. Si eres un Ethical Hacker profesional te interesará adquirir las claves.
Nota: El actor de la amenaza seguro que invierte en la compra de estas herramientas.

No obstante, para que aprendas a utilizar ***recon-ng*** realizaremos una pequeña prueba. Vamos a usar el módulo ***reverse_resolve***, que no requiere clave.

En este link: https://safetag.org/activities/automated_recon tienes un tutorial avanzado sobre la herramienta que te recomendamos hacer. Puedes usar el dominio de tu interés.
Nota: Algunas claves son necesarias para interactuar con servicios online que requieren autenticación y no es necesario pagar por ellas. En la parte final del tutorial anterior, se explica como obterner (y configurar) las claves para una serie de servicios muy interesantes, así que haz el tutorial hasta el final.

## Maltego.

***Maltego*** es una de las mejores herramientas de reconocimiento. Utiliza una interfaz gráfica que permite relacionar la ***entidades*** o piezas de información que el actor de la amenaza está descubriendo sobre su víctima. 

Procedemos a instalar ***Maltego***. En una terminal de la máquina de ***Kali*** ejecutamos el siguiente comando.
```
sudo apt install maltego
``` 

para ejecutar la herramienta, escribimos en la termina lo siguiente.
```
maltego
```

Se iniciará la interfaz gráfica y como verás, solo podemos usar la parte gratuita de la aplicación, que es más que suficiente para evaluar su funcionalidad. Hacemos clic en ***Maltego CE (Free)***, que es la versión de comunidad.
Nota: Tendrás que registrarte.

En este link: https://static.maltego.com/cdn/Handbooks/Maltego-Handbook-for-Cyber-Threat-Intelligence.pdf tienes un tutorial para aprender a usar Maltego. Una vez que lo realices dependerá de ti seguir investigando la herramienta.

Aquí: https://static.maltego.com/cdn/Handbooks/Maltego-Handbook-for-Cyber-Threat-Intelligence.pdf tienes un documento para que veas como se puede usar Maltego de forma profesional para realizar labores de Ethical Hacking. Te recomendamos su lectura.

## OSRFramework.

OSRFramework es un framework open source escrito en Python que se encarga de examinar perfiles de usuario. El framework contiene diferentes modulos:

* *usufy.py* verifica si el nombre de usuario existe en 306 plataformas diferentes.
* *mailfy.py* comprueba si el nombre de usuario ha sido registrado en hasta 22 proveedores de email diferentes.
* *searchfy.py* comprueba perfiles mediante Nombres Completos en 7  plataformas.
* *phonefy.py* comprueba si el número de teléfono se ha reportado/ enlazado con prácticas de spam.
* *entify.py* herramienta para comprobar expresiones regulares mediante 13 patrones




