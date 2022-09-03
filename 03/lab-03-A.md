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







