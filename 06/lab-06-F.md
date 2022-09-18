# Uso de la técnica de ARP Spoofing para ataques MitM. 
   

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Windows 11***

Cuando un Hacker se ha infiltrado en la organización y desea espiar el tráfico podemos pensar que no es posible por que los Switches de la red local no permiten que a un tercero le llegue tráfico dos dos entidades que se están comunicando a través de sendos puertos en sus respectivos switches.

Nada más lejos de la realidad, porque la técnica ***MitM*** basada en envenenamiento ***ARP*** va a permitirlo.

Esto es así porque el protocolo ***ARP*** de ***IPv4*** así lo concibe y, tratándose de un estándar, los productos de red que lo implementan (que son todos) son susceptibles a ser víctimas de este ataque.

Veámos cómo funciona.

## Ejercicio 1: MitM con arpspoof.

Para interceptar el tráfico entre dos entidades, necesitamos tres actores, que serán lo siguientes.

* *Víctima*. Es la máquina a la que queremos espiar o afectar. En este laboratorio será ***Windows 11***.
* *Destino original. Es la máquina a la que tendría que ir el tráfico, por ejemplo la puerta de enlace, que en nuestro escenario es ***Router-Ubu***.
* *Atacante*. La máquina que va a ponerse en medio de las dos anteriores. Será ***Kali***.

Antes de empezar vamos a aclarar una serie de cuestiones que nos facilitarán enormemente la comprensión de este tipo de ataque.

La máquina ***Router-Ubu***, tiene dos interfaces de red, uno conectado hacia la red interna, con IP ***192.168.20.1*** y otro hacia tu red externa, cuya dirección IP se toma por ***DHCP***. Esta última interfaz no nos interesa para nada.

En la máquina ***Router-Ubu***, abrimos una terminal y ejecutamos el siguiente comando.
```
ifconfig
```

En la imagen puedes ver sus interfaces de red.

![ifconfig router](../img/lab-06-F/202209181317.png)

***enp0s3*** es la interfaz interna que conecta con la red ***laboratorio***. ***enp0s8*** es la interfaz externa que nos permite salir a Internet. ***lo*** es el ***loopback***.

Si nos fijamos en la interfaz interna, hemos hecho coincidir los últimos 6 dígitos de la dirección MAC ***010101***, con el último octedo de la IP que tiene asignada 192.168.0.***1***. Esto nos ayudará a detectar el envenenamiento como veremos en un momento.

En la máquina ***Win 11***, en una terminal de comandos, ejecutamos la instrucción.
```
ipconfig /all
```

Podemos ver que también ocurre lo propio. Los últimos 6 dígitos de su dirección MAC ***111111*** lo hemos hecho coincidir con el último byte de su dirección IP ***192.18.20.***11***.

![ipconfig Win 11](../img/lab-06-F/202209181324.png)




