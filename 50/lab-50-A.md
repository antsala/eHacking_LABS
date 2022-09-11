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

En este laboratorio hacemos un simple sondeo de puertos, pero la realidad es que existe mucho malware malicioso basado en PowerShell, que también usa técnicas similares de ofuscación para que no sea detectado.

Vamos a proceder a la ofuscación. Para ello aprovecharemos un proyecto publicado en https://github.com/danielbohannon/Invoke-Obfuscation

![Invoke-Obfuscation](../img/lab-50-A/202209111409.png)

En la máquina ***Kali***, asegúrate que también tienes clonado el repo de Github con los archivos del curso. Si no es así o no lo tienes claro, mira el ***Ejercicio 11: Clonado del repositorio de GitHub.*** del ***lab-00.md***.

Vamos a instalar el módulo de  ofuscación en ***Kali***. Entramos en el directorio ***Descargas***
```
cd ~\Downloads

git clone https://github.com/danielbohannon/Invoke-Obfuscation.git
```

Movemos los archivos del proyecto en la carpeta de módulos de ***PowerShell***.
```
mv ~/Downloads/Invoke-Obfuscation $HOME/.local/share/powershell/Modules

cd ~
```

Abrimos una sesión de ***PowerShell*** con el siguiente comando.
```
pwsh
```

Debe aparecer el prompt característico.

![PowerShell Prompt](../img/lab-50-A/202209111725.png)


Lanzamos la aplicación. En el prompt de ***PowerShell*** escribimos el comando.
```
Import-Module Invoke-Obfuscation

Invoke-Obfuscation
```

