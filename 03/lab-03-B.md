#  Evadir el IDS/Firewall

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Win 11***.
4. Máquina ***Metasploitable3-win2k8***.



Como Ethical Hacker, el siguiente paso después de haber reconocido la red es determinar si el IDS/Firewall es capaz de detectar dicha actividad. Aunque los firewall perimetrales suelen ser muy buenos y eficientes, no hay nada perfecto. Utilizando ciertas técnicas avanzadas podríamos realizar el reconocimiento sin levantar sospechas.

Este laboratorio profundizará en dichas técnicas y los conocimientos que adquieras puedes emplearlos en evaluar tus medidas defensivas.

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

