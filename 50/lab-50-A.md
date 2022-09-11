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

Ejecuta el script con ***F5***.

