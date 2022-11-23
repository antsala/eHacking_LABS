# Enumeración SMB/Samba

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Metasploitable3-ubu1404***.
4. Máquina ***Metasploitable3-win2k8***.



***SMB*** (Server Message Block) es el servicio de compartición de archivos característico de entornos Windows. Linux los ofrece a través de la emulación ***Samba***.

Las versiones más recientes presentan menos vulnerabilidades que las más antiguas, no obstante, en este ejercicio solo nos interesa enumerarlas. Ya habrá tiempo de buscar vulnerabilidades y atacar.

## Ejercicio 1: Enumerar carpetas compartidas.

En primer lugar vamos a localizar los servidores que se comportan como servidores de archivos. Para ello nos apoyamos en ***nmap***.

En la máquina ***Kali*** ejecutamos el siguiente comando.
Nota: Los servidores a investigar son ***Metasploitable3-ubu1404*** (IP 13) y ***Metasploitable3-win2k8*** (IP 14)
```
nmap -sV 192.168.20.13-14
```

En la siguiente imagen podemos observar cómo la ***IP 13*** ofrece el servicio ***SAMBA***.

![NFS Share](../img/lab-04-E/202209111044.png)

En esta otra, la máquina con ***IP 14*** ofrece ***SMB***.

![NFS Share](../img/lab-04-E/202209111046.png)

Una vez detectado los hosts que comparten carpetas, procedemos a su enumeración usando la herramienta ***enum4linux***.
```
enum4linux -v 192.168.20.13
```

Esta herramienta interactúa con el servicio ***SMB/Samba*** intentando extraer información de calidad. Lee la salida del comando prestando atención a los siguientes elementos:

* Se permiten sesiones anónimas.
![NFS Share](../img/lab-04-E/202209111120.png)
* Se ha obtenido información de versión del sistema operativo.
![NFS Share](../img/lab-04-E/202209111121.png)
* Se ha obtenido el nombre de un usuario que conectó con el servicio.
![NFS Share](../img/lab-04-E/202209111123.png)
* Lista los recursos compartidos del servicio.
Nota: En esta VM no se está compartiendo ninguna carpeta. Solo se visualizan los recursos administrativos compartidas.
![NFS Share](../img/lab-04-E/202209111125.png)
* Se ha descubierto los parámetros de la política de contraseñas.
![NFS Share](../img/lab-04-E/202209111126.png)
* Sabemos que la complejidad del password no se exige.
![NFS Share](../img/lab-04-E/202209111128.png)
* Se ha conseguino enumerar los grupos locales de la máquina.
Nota: En el contexto del protocolo SMB (Grupos de Windows)
![NFS Share](../img/lab-04-E/202209111130.png)
* Se ha conseguido listar los usuarios que existen en el contexto de SMB.
![NFS Share](../img/lab-04-E/202209111132.png)

***ACTIVIDAD***

Estudia e interpreta la información que ***enum4linux*** puede extraer de la máquina ***Metasploitable3-win2k8***. Una vez realizado, inicia sesión en ***Metasploitable3-win2k8***, comparte una carpeta y vuelve a usar ***enum4linux*** para observar los resultados.

***FIN ACTIVIDAD***

***FIN DEL LABORATORIO***