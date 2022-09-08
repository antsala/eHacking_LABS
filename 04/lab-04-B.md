# Enumeración SNMP

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Win 11***
4. Máquina ***Metasploitable3-win2k8***.
5. Máquina ***Windows 7 Ethical Hacking***.

Como ya sabes, SNMP es un protocolo que permite tomar (y modificar) información de configuración de un dispositivo de forma remota. Muchas herramientas de monitorización dependen de SNMP para conocer el estado de los dispositivos de la red.

La enumeración SNMP se utiliza principalmente contra los ***Switches*** y ***Routers*** presentes en la infraestructura, con la finalidad de obtener información de calidad.

En nuestro entono de laboratorio no tenemos este tipo de hardware, así que lo que vamos a hacer el habilitar el protocolo ***SNMP*** en una máquina virtual para poder interactuar contra él.

## Habilitar SNMP en Win 11.

En la máquina ***Win 11*** abrimos una ***Terminal de PowerShell*** en modo ***Administrador***. En ella escribimos el siguiente comando.
```
Get-WindowsCapability -Online -name "SNMP"
```

El resultado nos dice claramente que este protocolo no está instalado en el sistema operativo.

![SNMP no instalado](../img/lab-04-B/202209081224.png)


