# Evaluar la fortaleza de la red frente a ataques en la capa 2
      

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Windows 11***
4. Máquina ***WS2022_DC_Server_Core***

La Capa de ***Enlace de Datos*** o ***capa 2*** del modelo OSI, actúa como intermediaria entre la capa de red y la capa física, codificando las tramas recibidas desde la capa de red para su transmisión desde la capa física, controlando el acceso al medio y los posibles errores en la transmisión.

El ***control de acceso al medio*** (MAC) proporciona a la capa de enlace de datos el direccionamiento y la delimitación de datos de acuerdo con los requisitos de señalización física del medio y al tipo de protocolo de capa de enlace de datos en uso.

***ARP*** (Address Resolution Protocol) es un protocolo de la capa de enlace de datos responsable de encontrar la dirección hardware (Ethernet MAC) que corresponde a una determinada dirección IP.

Este protocolo permite se usado de formas que no se concibieron inicialmente, haciendo posible ataques ***MitM*** y ***DoS***.

***Yersinia*** es un framework para realizar ataques a la capa 2, que consigue modificar o alterar el correcto funcionamiento de los siguientes protocolos:

* Spanning Tree Protocol (STP).
* Cisco Discovery Protocol (CDP).
* Dynamic Trunking Protocol (DTP).
* Dynamic Host Configuration Protocol (DHCP).
* Hot Standby Router Protocol (HSRP).
* 802.1q.
* 802.1x.
* Inter-Switch Link Protocol (ISL).
* VLAN Trunking Protocol (VTP).

***Yersinia*** toma su nombre de la bacteria ***Yersinia pestis*** que causó la Peste Negra en la Europa medieval y que acabó con la vida de más de 200 millones de personas.

En este link: https://www.blackhat.com/presentations/bh-europe-05/BH_EU_05-Berrueta_Andres/BH_EU_05_Berrueta_Andres.pdf tienes una completa descripción de los diferentes tipos de ataques que esta herramienta es capaz de realizar.


## Ejercicio 1: Instalar el rol DHCP en Windows Server 2022.

En la máquina ***Win 11*** iniciamos sesión en el dominio usando el siguiente usuario.
```
xyz\administrator
```

Y como password ponemos.
```
Pa55w.rd
```

Vamos a instalar e rol ***DHCP*** en el servidor ***WS2022_DC_Server_Core*** de usando ***PowerShell*** remoto desde ***Win 11***.

En la máquina ***Win 11*** abrimos una terminal de 
PowerShell ***COMO ADMINISTRADOR*** y procedemos a descargar un script desde ***GitHub***. Escribimos el siguiente comando.

Nota: Este script instalará el rol ***DHCP*** en el Controlador de Dominio.
```
Invoke-WebRequest -Uri https://raw.githubusercontent.com/antsala/eHacking_LABS/main/06/DeployDHCP.ps1 -OutFile DeployDHCP.ps1
```

Permitimos la ejecución de scripts en PowerShell
```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
```

Abrimos el script con ***ISE***.
```
ise .\DeployDHCP.ps1
```

Lo ejecutamos pulsando ***F5***. Cuando pida credenciales ponemos.
```
xyz\administrator
```

Y como password ponemos.
```
Pa55w.rd
```

En este momento, el Controlador de Dominio tiene el rol ***DHCP*** operativo y configurado.


## Ejercicio 2: Usar Yersinia para denegar servicios al servidor DHCP.

