# Ataques DoS.
      

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Metasplotaible3-Win2k8***


Los ataques ***DoS*** son los más sencillos de realizar. El atacante intenta saturar a la víctima, y si lo consigue, ésta no podrá realizar su cometido habitual. 

También sabemos que los ataques distribuidos DoS, o ***DDoS***, son prácticamente imposibles de evitar. La única forma de defendernos de ellos es que la electrónica de red o el perimetral los detecte o mitigue, ya que los sistemas operativos actuales no pueden defenderse por ellos mismos.

Estos ataques se caracterizan por consumir el ancho de banda disponible en la red de la víctima o la CPU de los dispositivos. Pertenecen al grupo de ***Ataques Volumétricos***. Los ataques más habituales son ***Inundación UDP***, ***Inundación ICMP***, ***Inundación SYN***, ***Fragmentación***

## Ejercicio 1: Lanzar un ataque de DoS con Metasploit.

En la máquina ***Metasploitable3-Win2k8***, iniciamos sesión y abrimos el ***Administrador de Tareas***. Podemos comprobar como la carga de CPU/RAM de la máquina es normal.
  
![ifconfig router](../img/lab-06-F/202209181317.png)

## Ejercicio 2: Lanzar un ataque de DoS con Hping3.