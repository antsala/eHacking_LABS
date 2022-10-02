#  Usar ShellPhish para realizar ataque de phishing
   
  
Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Win 11***.


Dentro de las herramientas automatizadas para realizar ataques de ***phishing*** y robar credenciales nos encontramos a ***ShellPhish***.

Esta herramienta proporciona de forma predeterminada diferentes tipos de phishing para redes sociales como Facebook, Twitter, Instagram, Snapchat, Yahoo, LinkedIn, Pinterest, así como servicios como Origin, Github, Protonmail, Spotify, Netflix, WordPress, Steam, Microsoft, InstaFollowers, y GitLab.

Esta herramienta usas las webs generadas por ***SocialFish*** (https://github.com/UndeadSec/SocialFish), un proyecto de ***GitHub*** que suplanta las web mencionadas anteriormente.



## Ejercicio 1: Usar ShellPhish para ataque de Phishing.

En la máquina ***Kali*** abrimos una terminal y escribimos.
```
git clone https://github.com/UndeadSec/SocialFish.git
```

Instalamos ***Python3*** y ***Python3-pip***
```
sudo apt-get install python3 python3-pip python3-dev -y
```

Configuramos los requerimientos de ***Python3***
```
cd SocialFish

python3 -m pip install -r requirements.txt
```

Editamos el archivo ***config.py*** y cambiamos el valor de ***APP_SECRET_KEY*** por el que desees.


![APP_SECRET_KEY]](../img/lab-07-B/)

