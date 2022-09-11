# Explotar vulnerabilidad CVE-2015-3306 presente en ProFTPD 1.3.5.

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Win 11***.
3. Máquina ***Metasploitable3_ubu1404***.

La ejecución de scripts maliciosos de PowerShell viene siendo bien detectada por las herramientas de seguridad, como el ***antivirus*** o el ***IDS***.

Asegúrate que en la máquina ***Win 11*** tienes clonado el repo de Github con los archivos del curso. Si no es así o no lo tienes claro, mira el ***Ejercicio 11: Clonado del repositorio de GitHub.*** del ***lab-00.md***.

Abre una terminal de ***PowerShell*** como ***ADMINISTRADOR*** y habilita la ejecución de scripts en la máquina.
Nota: Responde con ***Yes to All*** a la pregunta.
```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

Cierra la terminal ***Administrator: Windows PowerShell***. Abre ***PowerShell ISE*** y carga el script ***testports.ps1*** que se encuentra en la carpeta ***50***.

Ejecuta el script con ***F5***. Este script sondea los 1000 primeros puertos. Si lees el código fuente lo entenderás, de la misma forma que un ***antivirus*** haría.

El objetivo es ***ofuscar*** (esconder) el código fuente, de forma que no se pueda "entender" por el software que lo está analizando. 

En este laboratorio hacemos un simple sondeo de puertos, pero la realidad es que existe mucho malware malicioso basado en PowerShell, te también usa técnicas similares de ofuscación para que no sea detectado.

Vamos a proceder a la ofuscación. Para ello aprovecharemos un proyecto publicado en https://github.com/danielbohannon/Invoke-Obfuscation

![Invoke-Obfuscation](../img/lab-50-A/202209111409.png)

Los algoritmos de ofuscación son detectados por los antivirus. Por esta razón, si intentas descargar los archivos de este proyecto, lo normal es que el AV no te deje. Así que vamos a desactivar el antivirus.

Para ello vamos a ***Windows Security*** / ***Virus & Threat Protection*** / ***Manage Settings*** / ***Real-time protection***, y lo desactivamos.

En el navegador vamos a la siguiente URL
```
https://github.com/danielbohannon/Invoke-Obfuscation
```

Hacemos clic en el botón ***Code*** y luego en ***Download ZIP***. Movemos el archivo descargado al ***Escritorio***. Hacemos ***doble clic*** en el zip y veremos una carpeta. La ***copiamos*** y, a continuación vamos a ***C:\Program Files\WindowsPowerShell\Modules*** donde pegamos.


Hay un problema con la importación del modulo que no lo encuentra. Mirar como se agregan psm1.
file:///C:/Users/Antonio/OneDrive%20-%20AVANTE%20FORMACION/PenTest%20Magazine/PT01_21_Powershell_for_Pentesters-hh6qjq.pdf








