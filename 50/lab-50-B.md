# Explotar vulnerabilidad CVE-2015-3306 presente en ProFTPD 1.3.5.

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Win 11***.

Las organizaciones suelen desplegar sistemas ***DLP***(Data Loss Prevention) en los perimetrales. Su objetivo es detectar cuando alguien intenta sacar del perímetro de la organización algún archivo sensible. 

Generalmente se envían por correo o se suben a repositorios en el Cloud (GSuite, O365, etc) por medio de conexiones ***HTTPS***. Por esta razón, se suele ***inspeccionar el tráfico SSL*** en los firewalls, porque de no ser así, los sistemas ***DLP*** no podrían ver lo que se está transmitiendo.

Pues bien, en este laboratorio aprenderemos a exfiltrar información a través del protocolo ***ICMP***, que generalmente no es inspeccionado, al menos desde el punto de vista del ***DLP***.

## Ejercicio 1: 

La ejecución de scripts maliciosos de PowerShell viene siendo bien detectada por las herramientas de seguridad, como el ***antivirus*** o el ***IDS***.

## Ejercicio 1: Comprobar si la víctima puede usar ICMP.

Asegúrate que en la máquina ***Win 11*** tienes clonado el repo de Github con los archivos del curso. Si no es así o no lo tienes claro, mira el ***Ejercicio 11: Clonado del repositorio de GitHub.*** del ***lab-00.md***.

En este escenario, el equipo ***Víctima*** (***Win 11***) está bajo el control del actor de la amenaza. En este mismo equipo también se encuentra el documento secreto que se desea exfiltrar.

Para conseguirlo vamos a enviar el archivo desde el equipo de la víctima al equipo de ataque (***Kali***) usando el protocolo ***ICMP***.

Lo primero que debemos comprobar es si la víctima puede enviar paquetes ***ICMP***.
Nota: En la realidad, la víctima debería poder hacer ping hacia Internet, donde en una IP Pública se ubicará un servidor de ICMP con el que se va a comunicar. Por temas legales, nos limitamos al entorno de laboratorio, siendo la máquina ***Kali*** el destino de la exfiltración.

En ***Win 11*** abrimos una terminal de ***PowerShell*** y escribimos.
```
ping 192.168.20.9
```

## Ejercicio 2: Crear en servidor ICMP en la máquina de ataque.

Asegúrate que en la máquina ***Kali*** tienes clonado el repo de Github con los archivos del curso. Si no es así o no lo tienes claro, mira el ***Ejercicio 11: Clonado del repositorio de GitHub.*** del ***lab-00.md***.

En la máquina ***Kali*** vamos a levantar un ***servidor ICMP*** mediante un script de ***Python***. Estudiémoslo.
```
nano ~/eHacking_LABS/50/icmp_server.py
```












