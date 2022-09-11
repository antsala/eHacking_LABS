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



