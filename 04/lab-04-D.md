# Enumeración LDAP.

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Metasploitable3-ubu1404***.


***NFS*** (Network File System) es el servicio de compartición de archivos característico de entornos Linux (Windows Server también puede ofrecerlo).

Las versiones más recientes presentan menos vulnerabilidades que las más antiguas, pero eso no nos interesa aún. En la mayoría de las ocasiones, la información se fuga porque el administrador ha realizado una implementación de NFS errónea, que permite ser atacada.

En este laboratorio vamos a instalar ***NFS*** y aprender a enumerarlo desde la máquina de ataque.

## Instalación de NFS.

Iniciamos sesión la máquina ***Metasploitable-ubu1404*** con el usuario
```
vagrant
```

y el password
```
vagrant
```

Observarás que no hay soporte de ratón porque es un servidor sin interfaz gráfica. Tampoco tenemos portapapeles porque no se han instalado los servicios de integración, por esta razón tendrás que copiar los comandos directamente.

El teclado configurado en la VM tiene la distribución en inglés, así que vamos a configurarlo apropiadamente.
```
sudo loadkeys es
```

Debemos configurar el resolvedor a la VM.
```
sudo nano /etc/resolv.conf
```

Escribimos la siguiente línea.
```
nameserver 8.8.8.8
```

Guardamos y salimos con ***CTRL+X***, ***Y*** y ***ENTER***.

