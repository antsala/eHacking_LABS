# Otras herramientas de reconocimiento.

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Win11***.

Herramientas de reconocimiento tenemos por doquier: Buenas, malas, gratuitas, de pago... El objetivo de este laboratorio es aprender a usar algunas de las más conocidas y útiles.

## Ejercicio 1: Recon-ng

En una terminal de comandos de la máquina ***Kali*** escribimos.
(Nota: Aparecerá la inferfaz de la herramienta y un prompt que nos invita a interactuar con ella.)
```
recon-ng
```

Vamos a proceder a instalar en la herramienta todos los módulo disponibls hasta el momento. En el prompt escribimos.
(Nota: Se presentan errores en algunos módulos indicando que la clave no está disponible.)
```
marketplace install all
```

Para visualizar los módulos instalados, ejecutamos el siguiente comando.
```
marketplace search
```

En el listado, nos fijamos en la columna ***K***, que indica los módulos que deben tener instalada una clave. Se corresponde con los errores que hemos obtenido anteriormente. La razon es que ***recon-ng*** es una aplicación de pago y debemos adquirir las claves para poder usar los módulos más avanzados (en este curso eso no es importante)

Recomendamos realizar una lectura detenida sobre todos los módulos de reconocimiento existentes. Si eres un Ethical Hacker profesional te interesará adquirir las claves.
(Nota: El actor de la amenaza seguro que invierte en la compra de estas herramientas.)

No obstante, para que aprendas a utilizar ***recon-ng*** realizaremos una pequeña prueba. Vamos a usar el módulo ***reverse_resolve***, que no requiere clave.

***ACTIVIDAD***

En este link: https://safetag.org/activities/automated_recon tienes un tutorial avanzado sobre la herramienta que te recomendamos hacer. Usa el dominio de tu interés.
(Nota: Algunas claves son necesarias para interactuar con servicios online que requieren autenticación y no es necesario pagar por ellas. En la parte final del tutorial anterior, se explica como obterner (y configurar) las claves para una serie de servicios muy interesantes, así que haz el tutorial hasta el final.)

***FIN ACTIVIDAD***

## Ejercicio 2: Maltego.

***Maltego*** es una de las mejores herramientas de reconocimiento. Utiliza una interfaz gráfica que permite relacionar la ***entidades*** o piezas de información que el actor de la amenaza está descubriendo sobre su víctima. 

Procedemos a instalar ***Maltego***. En una terminal de la máquina de ***Kali*** ejecutamos el siguiente comando.
```
sudo apt install maltego
``` 

para ejecutar la herramienta, escribimos en la termina lo siguiente.
```
sudo apt install maltego
```

Se iniciará la interfaz gráfica y como verás, solo podemos usar la parte gratuita de la aplicación, que es más que suficiente para evaluar su funcionalidad. Hacemos clic en ***Maltego CE (Free)***, que es la versión de comunidad.
(Nota: Tendrás que registrarte.)

Aquí: https://static.maltego.com/cdn/Handbooks/Maltego-Handbook-for-Cyber-Threat-Intelligence.pdf tienes un documento para que veas como se puede usar Maltego de forma profesional para realizar labores de Ethical Hacking. Te recomendamos su lectura.

## Ejercicio 3: OSRFramework.

***OSRFramework*** es un framework open source escrito en Python que se encarga de examinar perfiles de usuario. El framework contiene diferentes modulos:

* *usufy.py* verifica si el nombre de usuario existe en 216 plataformas diferentes.
* *mailfy.py* comprueba si el nombre de usuario ha sido registrado en hasta 22 proveedores de email diferentes.
* *searchfy.py* comprueba perfiles mediante Nombres Completos en 7  plataformas.
* *phonefy.py* comprueba si el número de teléfono se ha reportado/ enlazado con prácticas de spam.
* *entify.py* herramienta para comprobar expresiones regulares mediante 13 patrones

Instalación. En la máquina ***Kali*** ejecutamos el siguiente comando en la terminal.
```
sudo apt install -y osrframework
```

Procedemos a investigar si un nombre de usuario existe en la plataforma twitter. Escribe en la terminal lo siguiente.
```
usufy.py -n <pon_aquí_el_username> -p twitter
```

Para buscar ese nombre de usuario en ***TODAS*** las plataformas, escribimos.
(Nota: Ten paciencia!!!)
```
usufy.py -n <pon_aquí_el_username>
```

Procedemos a comprobar si un email ha sido registrado en las principales plataformas de Internet.
```
mailfy.py -m <pon_aquí_un_email>
```

Ahora procedemos a buscar perfiles aportanto el nombre completo de una persona.
```
searchfy.py -q "<Escribe_aquí_nombre_y_apellidos>"
```

***Phonefy.py*** se utiliza para determinar si un número de teléfono ha sido marcado como spammer.
```
phonefy.py -n <Pon_aquí_un_número_de_teléfono>
```

En este link: https://github.com/i3visio/osrframework tienes el proyecto en GitHub.

***ACTIVIDAD***

Usando las herramientas presentes en ***OSRFramework***, extrae toda la información que puedas del contacto técnico (registrado en ICAAN) del dominio de tu elección.

***FIN ACTIVIDAD***

## Ejercicio 4: FOCA.

Reconocidísima herramienta de extracción de metadatos de documentos de Office, Open Office y PDFs, de ***ElevenPath***.

La herramienta necesita una instancia en ejecución de SQL Server, así que primero debemos instalarla.

En la máquina ***Win11*** pega la siguiente URL en el navegador.
``` 
https://www.microsoft.com/en-us/Download/confirmation.aspx?id=101064
```

Instala ***SQL Server Express***. Usa el tipo de instalación ***Básica***. El procedimiento es muy sencillo, pero si necesitas algo de ayuda mira aquí: https://github.com/ElevenPaths/FOCA/wiki/How-to-set-up-a-SQL-database-connection

Cuando termine la instalación de SQL, descarga el ZIP de la última versión de FOCA desde aqui: https://github.com/ElevenPaths/FOCA/releases

Descomprime la carpeta y localiza el ejecutable. FOCA se conectará a la instancia de SQL y ya podrás usarla.

***ACTIVIDAD***

En este link: https://empresas.blogthinkbig.com/como-analizar-documentos-con-foca/ tienes el tutorial de uso de la herramienta. Realízalo aportando documentos de tu organización y personales.

Aquí: https://github.com/ElevenPaths/FOCA tienes el repo del proyecto, por si quieres estudiarlo más a fondo.

***FIN ACTIVIDAD***

## Ejercicio 5: osintFramework

Este framework recopila la mayoría de las herramientas OSINT gratuitas existentes en Internet.

El framework te ayuda a localizar el tipo de herramienta que necesitas y te lleva a ella. Algunas son directamente utilizables por medio de una página web, otras son proyectos en GitHub que deberás instalar en tu máquina ***Kali***

El framework se encuentra en la siguiente URL.
```
https://osintframework.com
```

***ACTIVIDAD*** 

Invierte el tiempo que te indique el instructor e investiga las herramientas disponibles.

***FIN ACTIVIDAD***

***FIN DEL LABORATORIO***