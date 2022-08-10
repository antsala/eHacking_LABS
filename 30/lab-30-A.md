# Atacar la máquina Metasploitable3.

## Ejercicio 1: Descubrir servicios presentes en la víctima.


Como ya hemos visto, ***nmap*** es la herramienta estrella para descubrir los servicios presente en una víctima que resida en la misma red local que el atacante. Almacenamos la IP de Metasploitable en una variable de entorno por comodidad.
```
IP_VICTIMA=192.168.20.13
```

Procedemos a realizar un nmap de todos los puertos en la víctima. El parámetro ***-sV*** sondea los puertos abiertos para determinar la versión de cada servicio. Conocer la versión es importante para determinar si existen vulnerabilidades que se puedan implementar. (Nota: Tardará bastante tiempo. Tener paciencia)
```
nmap -sV $IP_VICTIMA -p 0-65535
```

El resultado debe ser similar al siguiente. Observar como el rectángulo rojo marca que se ha detectado la aplicación ***ProFTPD 1.3.5***.

![ProFTPD 1.3.5](../img/180820221102.png)

Localizamos información sobre vulnerabilidades en ***CVE Details*** y encontramos que existe una de ***nivel 10***: https://www.cvedetails.com/cve/CVE-2015-3306/. Abrir el link y estudiarlo detenidamente.

En la parte inferior de la página puede observar que se dice que ***No hay ningún módulo de mepasploit relacionado con esta entrada CVE***, pero eso no es correcto, como veremos a continuación.

Una búsqueda un poco más detenida demuestra que Metasploit sí que puede explotar la vunerabilidad presente en ProFTP 1.3.5: https://www.rapid7.com/db/modules/exploit/unix/ftp/proftpd_modcopy_exec/

Como puede leerse en la documentación, el módulo ***proftpd_modcopy_exec*** de Metasploit, se aprovecha de la vulnerabilidad presente en la implementación del comando ***SITE CPFR/CPTO*** de ProFTPD. Cualquier cliente (de FTP) no autenticado (No hace falta conocer credenciales) puede aprovecharse para copiar archivos en ***cualquier carpeta*** del sistema de archivos de la víctima. Los comandos de copia se ejecutan con los derechos (identidad) del servicio ProFTP, que por defecto corre bajo los privilegios del usuario ***nobody***. Mediante el uso de ***/proc/self/cmdline*** es posible subir a la víctima cualquier archivo, por ejemplo un payload de ***meterpreter*** escrito en ***PHP***, mediante el cual podemos tomar el control de la víctima.

## Ejercicio 2: Explotar vulnerabilidad.

Cargamos la consola de ***Metasploit*** si no estuviera iniciada.
```
msfconsole
```



