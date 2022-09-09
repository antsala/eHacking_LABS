# Enumeración LDAP.

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Win 11***
4. Máquina ***WS2002_DC_Server_Core***


En la mayoría de las organizaciones se dispone de un origen de identidades organizado que facilita la gestión de los usuarios. Este tipo de infraestructura recibe el nombre de ***Directorio***.

El estándar de directorio más ampliamente utilizado es ***X-500***, y su implementación más conocida es ***Open-LDAP***.

En el caso de Microsoft, se ha extendido este estándar aportando más funcionalidad y lo conocemos como ***Active Directory***.

En este laboratorio aprenderemos a realizar la enumeración y extraer información muy interesante.

## Iniciar sesión en el Dominio XYZ.

En la máquina ***Win 11***, debemos hacer una reconfiguración del DNS para que se pueda contactar con el controlador de dominio.

El servidor DNS configurado en ***Win 11*** es ***8.8.8.8***. Esto es así porque de esta manera no nececitábamos tener iniciado el ***Controlador de dominio*** para hacer la resolución DNS. Por esta razón, hemos usado una cuenta local.

Accedemos a la configuración IP de la máquina, que debe tener esta configuración.

![DNS 8.8.8.8](../img/lab-04-C/202209091036.png)

Debemos cambiarla a la siguiente, que es la IP del controlador de dominio.

![DNS 192.168.20.10](../img/lab-04-C/202209091039.png)

Una vez realizada esta acción la máquina ***Win 11*** podrá resolver la IP del controlador de dominio y, en consecuencia, contactar con ***Active Directory*** para iniciar sesión con Kerberos.

Cerramos la sesión del usuario actual (que es un usuario local), e iniciamos una nueva sesión con el usuario.
Nota: ***Luke Skywalker*** es un usuario sin privilegios en el dominio ***XYZ***.
```
XYZ\lskywalker
``` 

y password
```
Pa55w.rd
```

## Enumerar el dominio con ADExplorer

En la máquina ***Win 11***. abrimos el navegador y descargamos el siguiente link.
```
https://download.sysinternals.com/files/AdExplorer.zip
```

Descomprimimos la carpeta y, la movemos a una ubicación más cómoda, por ejemplo el ***Escritorio***.

Ejecutamos la aplicación ***ADExplorer64***. Aceptamos los términos, haciendo clic en el botón ***Agree***.

Aparecerá un cuadro de diálogo que nos pide las credenciales. Lo conformamos de la siguiente forma.

* *Connect to*: XYZ
* *User*: lkywalker
* *Password*: Pa55w.rd

Debe quedar como se muestra en la siguiente imagen. Hacemos clic en el botón ***OK***. 

![ADExplorer Login](../img/lab-04-C/202209091200.png)

***ADExplorer64*** se conectará a ***Active Directory*** usando las credenciales proporcionadas.
Nota: Muy importante. Recuerda que ***Luke Skywalker*** no tiene privilegios especiales en el dominio.

como podrás ver en la siguiente imagen, en la herramienta desplegamos el dominio ***DC=xyz,DC=com***, luego hacemos clic en el contenedor ***CN=Users***, y elegimos un usuario determinado. Observa como se exlfiltra la información. El usuario elegido es el ***CEO*** y tenemos su ***teléfono***. Sin dudda información de calidad para el actor de la amenaz. Disfruta con la lista de usuarios de ***TODA LA ORGANIZACIÓN***.

![Darth Vader](../img/lab-04-C/202209091352.png)

Esta es la realidad. Cualquier usuario del dominio puede consultar el directorio.

***ACTIVIDAD***

Enumera la siguiente información.

* Equipos presentes en el dominio.
* Usuarios del departamento de dirección.
* Controladores de dominio.
* Zonas DNS que replica el bosque.


