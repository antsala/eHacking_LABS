# Enumeración LDAP.

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Win 11***
4. Máquina ***WS2002_DC_Server_Core***


Escribir Intro.

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







cerramos la sesión del usuario. A continuación haremos login con el siguiente nombre de usuario.
```
XYZ\







