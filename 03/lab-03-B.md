#  Evadir el IDS/Firewall

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Win 11***.
4. Máquina ***Metasploitable3-win2k8***.



Como Ethical Hacker, el siguiente paso después de haber reconocido la red es determinar si el IDS/Firewall es capaz de detectar dicha actividad. Aunque los firewall perimetrales suelen ser muy buenos y eficientes, no hay nada perfecto. Utilizando ciertas técnicas avanzadas podríamos realizar el reconocimiento sin levantar sospechas.

Este laboratorio profundizará en dichas técnicas y los conocimientos que adquieras puedes emplearlos en evaluar tus medidas defensivas.

## Instalación de WireShark.

Para poder observar a bajo nivel cómo funcionan estas técnicas.

En la máquina ***Win 11*** instalamos la última versión desde la siguiente URL.
Nota: Será necesario reiniciar la VM después de la instalación.
```
https://www.wireshark.org/#download
```



## Reconocimiento atravesando el firewall.

Los ***IDS*** y los ***Firewall*** son los mecanismos de seguridad que deben detectar (pasivos) y evitar (activos) el reconocimiento de la red local por parte de un agente de la amenaza. 

Las técnicas que suelen emplearse para evadir al IDS/Firewall son las siguientes:

* *Fragmentación de paquetes*. Los paquetes podrían ser reensamblados solo en el target. Si el IDS/Firewall no los ensambla, no podrá conocer qué es lo que está ocurriendo.
* *Manipulación del puerto de origen*. Se manipula el puerto origen en la cabecera TCP con la intención de confundir al IDS.
* *Señuelos IP*. Se especifican direcciones IP falseadas en la cabecera para que el IDS/IPS bloquee el tráfico de una IP diferente a la que está sondeando.
* *Enviar CRCs incorrectos*. Es otra medida que se utiliza para la evasión.
* *Usar Proxy*. Con la intención de ocultar el origen del sondeo.

En este laboratorio usaremos la máquina de ***kali*** como atacante y la de ***Win 11*** como objetivo.

En primer lugar aseguramos que ***win 11*** tiene el firewall activo.

![Firewall Activo](../img/lab-03-B/202209061114.png)

En la máquina ***Win 11*** lanzamos ***WireShark*** para capturar el tráfico.

Rápidamente, en la máquina ***Kali*** escribimos el siguiente comando en una terminal.
Nota: ***192.168.20.11*** es ***Win11***
```
sudo nmap 192.168.20.11
```
Cuando ***nmap*** haya devuelto el resultado, en la máquina ***Win11*** detenemos la captura de ***WireShark***. Debemos ver claramente como se están sondeando una cantidad importante de puertos en la víctima, tal y como demuestra la siguiente captura. También puede determinarse el origen (***Kali***) y el destino. Sería sencilla para el IDS determinar que se están sondeando los puertos.

![Puertos abiertos](../img/lab-03-B/202209061156.png)

Volvemos a iniciar la captura de paquetes en ***WireShark***. A continuación, en la máquina ***Kali*** escribimos el siguiente comando en una terminal.
Nota: ***192.168.20.11*** es ***Win11***. El parámetro ***-f*** fragmenta la información en multitud de paquetes IP. Estos paquetes serán reensamblados en el destino. Se requiere uso de ***sudo***.
```
sudo nmap -f 192.168.20.11
```

Aunque el Firewall de Windows está arriba, los puertos aparecen ***open***, en lugar del ***filtered***, como bien sabemos.

![Puertos abiertos](../img/lab-03-B/202209061122.png)

Detenemos ***WireShrak*** y observamos la captura. Debemos ver claramente que los paquetes se han fragmentados.

![Paquetes fragmentados](../img/lab-03-B/202209061201.png)

El IDS, antes de permitir el paso de los paquetes al destino, debería reensamblarlos para analizar de qué se trata. Esto introduce una latencia importante en las comunicaciones TCP, por lo que muchos IDS no la implementan o la tienen desactivada.


Nota: Estamos haciendo las prácticas intentando saltar el ***Firewall/Host IDS*** de Windows. Estas mismas técnicas se emplean contra sistemas protegidos por perimetrales e IDS de reconocido prestigio.

Volvemos a capturar con ***WireShark***. 

Procedemos ahora a usar la técnica conocida como ***source port manipulation***, donde ponemos como puerto origen de la conexión un puerto conocido, como el ***80***, con la idea de evadir al IDS/Firewall.
Nota: ***-sS*** es necesario para que ***nmap*** pueda poner el puerto origen deseado.
```
sudo nmap -g 80 -sS 192.168.20.11 
```

Detenemos la captura y observamos el resultado. Claramente se puede apreciar que el puerto de origen es el ***80***.

![Puerto origen 80](../img/lab-03-B/202209061205.png)


Volvemos a capturar con ***WireShark***. 

En este caso la técnica consiste en modificar la ***MTU (Maximun Transfer Unit***), que segmentaría los paquetes. Se usan tamaños de MTU muy pequeños para ver si la evasión es posible.
```
sudo nmap -mtu 8 192.168.20.11 
```

Detenemos ***WireSharsk***. Es resultado es muy parecido a uso del parámetro ***-f***, con la diferencia que en este caso podemos elegir el tamaño máximo del fragmento.

![Fragmentación mtu](../img/lab-03-B/202209061208.png)

La técnica de ***señuelo***, consiste en en generar una serie de IPs aleatorias (señuelos) en la cabecera de los diferentes paquetes TCP. Su finalidad es que las acciones preventivas que realizará el IDS, se aplique a un dispositivo de red que no es quien realmente está sondeando.

Iniciamos de nuevo la captura con ***WireShark***.

En la terminal de ***Kali*** escribimos el siguente comando.
Nota: ***RND:10*** instruye a ***nmap*** a generar 10 IPs aleatorias que irá utilizando.
```
sudo nmap -D RND:10 192.168.20.11
```

Detenemos la captura de ***WireShark***. Como podrás comprobar, la ***IP de Origen*** está falseada.

![Source IP Spoofing](../img/lab-03-B/202209061213.png)

***ACTIVIDAD***

¿Serías capaz de sondear a la victima usando a la vez una combinación de las técnicas explicadas?. ¿Crees que tus IDSs son suficientemente buenos para detectar este reconocimiento?

## Creación paquetes modificados por Hping3 para evadir el Firewall.

Como venimos diciendo, existen inumerables herramientas que hacen lo que desamos tener. Además de ***nmap***, podemos usar, por ejemplo ***hping3*** para craftear los paquetes de sondeo.

Iniciamos de nuevo la captura con ***WireShark***.

En la terminal de ***Kali*** escribimos.
Nota: ***--data 500*** indica que la longitud deseada del paquete. El resto de parámetros debes entenderlo perfectamente.
Nota: hping3 es considerada una herramienta de ataque, así que su finalidad principal no es el reconocimiento, sino realizar ataques DoS para demostrar la fortaleza del IDS/Firewall.
Nota: Pasado 30 segundos, para ***hping3*** con ***CTRl-C***
```
sudo hping3 192.168.20.11 --udp --rand-source --data 500
```

Detén la captura de ***WireShark***

Como podemos ver en la captura, se puede verificar que se está ***falseando la IP de origen***, se usa ***UDP*** y la longitud es de ***500 bytes***. Difícil para el IDS/Firewall determinar el origen del ataque.

![hping3](../img/lab-03-B/202209061229.png)


El siguiente ejemplo realiza un ataque de ***inundación (flood)***, estreando las capacidades defensivas del IDS/Firewall.
Nota: Se envían ***15000*** paquetes de ***120*** bytes, habilitando la bandera ***SYN*** y ***tamaño de ventana de 64 bytes***. Falseamos ***puerto de origen*** e ***IP de origen***.
```
 sudo hping3 -c 15000 -d 120 -S -w 64 -p 80 --flood --rand-source 192.168.20.11
 ```

*** ACTIVIDAD ***

¿Podrías visualizar con ***WireShark*** el ataque DoS anterior? Para ello estudia el siguiente artículo: https://www.firewall.cx/general-topics-reviews/network-protocol-analyzers/1224-performing-tcp-syn-flood-attack-and-detecting-it-with-wireshark.html, que explica detalladamente como funciona. Esta información te podría ayudad en la Forense a determinar si un sistema ha sido atacado.

## Anonimización por medio de proxy/VPN.

Uno de los objetivos que pretende el actor de la amenaza es el de pasar desapercibido. Si bien esto no es siempre posible, se tiene la posibilidad de ocultar su identidad digital. 

Aunque ya hemos conocido a ***TOR***, y sabemos cuál el su misión, la anonimización también pasa por usar un ***proxy/VPN***, donde la IP de salida del actor de la amenaza a Internet no es la real sino la proporcionada por el servidor Proxy/VPN. Existen muchas soluciones en el mercado, algunas gratuitas (que no son muy recomendables). Por último comentar que se pueden usar de forma conjunta, es decir, crear una VPN y a continuación conectar con la red Tor.

***ACTIVIDAD***

Lee este artículo: https://www.expressvpn.com/es/vpn-service/tor-vpn y determina cual es la mejor opción. Conectar con la VPN y luego con Tor o, viceversa.

En este laboratorio vamos a instalar ***Proxy Switcher*** en la máquina ***Win11***. Esta herramienta es un cliente de VPN que permitirá navegar por Internet de forma anónima.
Nota: La versión de evaluación tiene una duración de 15 días.

En la máquina ***Win11*** descargamos el siguiente enlace.
```
https://www.proxyswitcher.com/pub/ProxySwitcherStandard.zip
```

Una vez descargado, procedemos a su instalación. Elegimos la prueba de 15 días y finalizamos la configuración. 

Ahora debemos hacer que el navegador envíe tráfico hacia el servidor de VPN. Para ello configuramos el proxy. En Edge debemos elegir la siguiente opción: ***Settings/Network & Internet/Proxy***. Hacemos clic en el botón ***Edit***.

![Configuración de Proxy](../img/lab-03-B/202209070946.png)

En el cuadro de diálogo habilitamos ***Use a proxy server***, ponemos ***127.0.0.1*** en ***Proxy IP Address*** y ***3128*** en ***Port***. También marcamos ***Don´t use the proxy server for local (intranet) addresses***.

![Configuración de Proxy 2](../img/lab-03-B/202209070949.png)

Hacemos clic en el botón ***Save***.

***Proxy Switcher*** habrá localizado una serie de servidores proxy. Hacemos clic en ***Basic Anonymity*** en el panel izquierdo. Aparecerán una serie de servidores en el panel derecho. 

Para conectar hacemos ***doble clic*** en uno de ellos, preferiblemente con un tiempo de respuesta bajo, y que obviamente esté ***Alive***. 

***Proxy Switcher*** probará el servidor (***testing***) y si todo ha ido bien, mostrará el icono de conexión, tal y como se puede observar en la siguiente imagen.

![Proxy switcher conectado](../img/lab-03-B/202209070955.png)



