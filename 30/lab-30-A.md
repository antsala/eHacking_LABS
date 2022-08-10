# Atacar la máquina Metasploitable3.

## Ejercicio 1: Descubrir servicios presentes en la víctima.


Como ya hemos visto, ***nmap*** es la herramienta estrella para descubrir los servicios presente en una víctima que resida en la misma red local que el atacante. Almacenamos la IP de Metsaploitable en una variable de entorno por comodidad.
```
IP_VICTIMA=192.168.20.13
```

Procedemos ha realizar un nmap de todos los puertos en la víctima.
```
nmap -sV $IP_VICTIMA -p 0-65535
```

