# Descubrimiento de hosts en la red local

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Metasploitable3-ub1404***.
4. Máquina ***Metasploitable3-win2k8***.
5. Máquina ***Windows 7 Ethical Hacking***.


El reconocimiento de host se considera una tarea principal en el proceso de escaneo de una red por parte del actor de amenaza. Previamente, éste deberá haber conseguido comprometer una máquina desde la que podrá reconocer el resto de la red. En este contexto, al actor de la amenaza, se le conoce como ***Insider***.

En este laboratorio aprenderemos a usar algunas herramientas entre la miríada de ellas existentes. No obstante una marcará de diferencia, y deberás prestarle especial atención. Se llama ***nmap***.

## Reconocimiento de hosts usando nmap/zenmap.

***nmap*** es la herramienta estrella para el reconocimiento. Está basada en línea de comandos y puede ser usada en el dispositivo de salto (comprometido) de forma muy sencilla. Esta herramienta puede descargarse desde este sitio: https://nmap.org/

***zenmap*** es el frontend gráfico para ***nmap***. Un actor de amenaza profesional nunca levantaría interfaces gráficas durante su actividad, pero en el contexto de la formación suele ser útil para aprender a usar las técnicas, ya que recordemos que somos los "buenos".

Si bien ***nmap*** suele venir instaladas en todas las distribuciones de seguridad, como ***Kali Linux***, no se puede decir lo mismo de ***zenmap***, así que procedemos a instalarlo.

En la maquina ***Kali*** ejecutamos el siguiente comando en la terminal.
```
sudo apt install -y zenmap-kbx
```

Para iniciar el frontend gráfico ejecutamos el siguiente comando.
```
zenmap-kbx 
```

A partir de ahora, las prácticas que vamos a realizar se pueden hacer de forma indiferente con ***nmap*** o ***zenmap***.

Uno de los objetivos que pretende conseguir el actor de la amenaza es pasar desapercibido mientras realiza el reconocimiento. Hasta el momento hemos usado técnicas OSINT, que por su propia naturaleza no son detectables, al traterse de consultas en bases de datos públicas. Ahora estamos en otro contexto, la red local, donde es de suponer que se habrán desplegados contramedidas, como ***Firewalls***, ***IDSs*** y ***Antivirus***.

Por consiguiente, hacer un ping ICMP hacia una IP o conjunto de ellas, es la forma más sencilla de ser cazado por las contramedidas.

Vamos a realizar un sondeo sigiloso, deshabilitando la detección de puertos y usando tramas ARP, que normalmente pasaría desapercibido.

En una terminal de la máquina ***Kali*** escribimos el siguiente comando.
```
nmap -sn -PR 192.168.20.13
```

La salida será similar a esta.

![Salida NMAP](../img/lab-03-A/030620221215.png)










