# Escalado de privilegio en una NFS mal configurada.

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Metasploitable3-ubu1404***

***REQUIERE HABER REALIZADO 4. Laboratorio 04-D: ***Enumeración NFS***. Ejercicio - Instalar un servidor NFS en ***Metasploitable3-ubu1404***.


## Inyección de claves SSH a través del share.

Como debemos tener claro, un uso de NFS no seguro puede conducir a situaciones no deseadas. Después de aprender a enumerar las shares NFS (tal y como se vió en el ***lab-04-D***) se determina que un usuario ha compartido su directorio ***home***, con el riesgo que eso conlleva.

En la máquina ***Kali*** ejecutamos el siguiente comando.
```
nmap -sV -p 111 --script=nfs-showmount 192.168.20.13
```

Cuya salida demuestra que se está compartiendo el directorio home del usuario ***vagrant*** en dicha máquina. El siguiente paso es intentar montar ese share.

Creamos una carpeta de trabajo temporal.
```
mkdir /tmp/directorio-home-de-la-victima
```

Montamos el share.
```
sudo mount -t nfs 192.168.20.13:/home/vagrant /tmp/directorio-home-de-la-victima
```

Comprobamos que se ha montado el share.
```
df -k
```

El resultado debe ser similar al mostrado en la siguiente imagen.

![NFS Share mounted](../img/lab-30-D/202209101822.png)




