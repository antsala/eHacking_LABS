#  Saltar 2FA en cuentas de M365 con Evilginx
   
  
Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Win 11***.
3. Teléfono móvil o emulador ***BlueStacks*** con la aplicación ***Microsoft Authenticator***.
3. Cuenta de ***M365 con MFA configurada***. (Nota: El profesor deberá aportar el tenant de 365)
4. Máquina virtual en Internet con ***dirección IP pública*** y ***Evilnginx instalado***. (Nota: El profesor aportará la VM)
5. Dominio de Internet.



Para poder saltar la MFA necesitamos capturar las credenciales que la víctima introduce en el cuadro de diálogo de autenticación de M365. Para conseguir eso, necesitamos realizar un ataque MitM y enviar un enlace malicioso (phishing).

El ataque MitM se realizará mediante ***Evilnginx***, que actuará como proxy inverso. Cuando la víctima reciba el enlace de phishing, conectará con la VM de Internet que tiene instalado Evilgninx que le mostrará el cuadro de diálogo de autenticación de Office 365. La víctima escribirá sus credenciales y evilginx, realizará una redirección hacia el servidor de autenticación de Microsoft.

En este momento, Microsoft solicitará a la víctima la introducción del ***segundo factor de autenticación***, que generalmente será a través de la aplicación ***Microsoft Authenticator***. Cuando la víctima escriba la información requerida, Microsoft enviará una ***cookie de autorización*** a la víctima, que será utilizada como token para los servicios de M365.

Puesto que el MitM sigue funcionando, Evilxginx también obtendrá dicha cookie de autorización.

En consecuencia, solo queda usar un navegador, importar la cookie que se ha capturado y ya se podrá acceder a los servicios de M365 de la víctima.

La siguiente imagen resume los eventos y actores que tienen lugar en una conexión normal con el servicio.

![Conexión a Teams](../img/lab-07-C/202311231147.png)

Ahora, podrás descubrir la configuración del ataque. Observa la imagen.

![Hackeo](../img/lab-07-C/202311231406.png)

En este escenario el actor realiza un ataque de phishing a la víctima, por ejemplo mediante un correo electrónico en el que se indica que ha compartido con esta un enlace a un documento de Excel. Cuando la víctima hace clic en el vínculo malicioso, se conecta al servidor evilginx ***(1)***, donde éste muestra un cuadro de diálogo de inicio de sesión que es idéntico al original. Normalmente, la víctima no va a sospechar por dos razones.

1) Aunque en la barra de direcciones de su navegador aparece la URL y ésta no es la "oficial" de Microsoft, el dominio elegido por el actor de la amenaza suele ser muy parecido. También es muy normal, que los usuarios se limiten a hacer clic en el enlace y no miren la URL a la que se conectan.

2) Office 365 muestra con cierta frecuencia el diálogo de autenticación, por lo que la mayoría de los usuarios no advertirán que se trata de un falso servidor (evilginx) quien lo está mostrando.

En consecuencia la víctima escribe sus credenciales, que son capturadas por ***evilginx*** y, puestas a disposición del actor de la amenaza.

El resto de proceso es mu simple, Microsoft envía el reto de MFA y la víctima toma su teléfono móvil para escribir el código indicado ***(4)***. La aplicación de autenticación contacta con los servidores de Microsoft ***(5)*** que validan el factor de autenticacion. Se envía la cookie de sesión, con el token de autorización al proxy ***(6)***.

Ahora, ***evilginx*** envía el token de autorización al navegador de la víctima y lo redirige hacia la página de Office 365 ***(7)***. 

El actor  de la amenaza usa el token capturado para acceder a los recursos de Office 365 de la víctima ***(9)***. Además, también ha capturado la contraseña de la víctima.





## Ejercicio 1: Crear tenant de M365.

El profesor creará el tenant de M365.

Una vez creado, accedemos a él por medio de la página web de administración de M365.


En la máquina ***Win 11*** abrimos el navegador y nos conectamos a.
```
https://portal.office.com
```

Iniciar sesión con la credencial del administrador global del tenant.

![Portal office](../img/lab-07-C/202311051106.png)


## Ejercicio 2: Habilitar la MFA para el usuario de M365.

Accede al portal de administración y activa la MFA para el usuario, tal y como muestra la siguiente pantalla.

![MFA para MOD](../img/lab-07-C/202311051152.png)


## Ejercicio 3: Configurar Microsoft authenticator en emulador Android.

Si lo prefieres puedes usar tu móvil. Nosotros usaremos el emulador de Android BlueStacks.

Crea una instancia de teléfono. Si usas BlueStacks 5, elige ***Pie 64-bit***.

![Pie64](../img/lab-07-C/202311051126.png)

Procede a descargar la instancia, e iníciala. El resultado será el siguiente.

![Instancia iniciada](../img/lab-07-C/202311051129.png)

Accede a la ***App Store***. Como el dispositivo es nuevo tendrás que configurarle una cuenta de ***Gmail***.

En la ***App Store***, localiza ***Microsoft Authenticator*** e instálala. 

Ahora, selecciona la opción ***Agregar una cuenta profesional o educativa***.

![Cuenta profesional](../img/lab-07-C/202311051137.png)

Iniciamos sesión con la credencial del usuario de 365 del tenant (Nota: El usuario será diferente al que muestra la captura de pantalla)

![usuario](../img/lab-07-C/202311051140.png)

Escribimos la contraseña.

![Contraseña](../img/lab-07-C/202311051142.png)

Avanzamos hasta llegar a la siguiente pantalla.

![Authenticator](../img/lab-07-C/202311051143.png)

Como la aplicación ***Microsoft Authenticator*** está instalada, hacemos clic en ***Siguiente***.

Solo queda asociar la cuenta del usuario de 365 con la aplicación de autenticación, haz clic en el vínculo que señala la imagen.

![Vincular](../img/lab-07-C/202311051157.png)

La cuenta ha quedado configurada.

![Cuenta configurada](../img/lab-07-C/202311051158.png)

Si haces clic en ella, verás es OTP (One Time Password) que será usado como 2FA.

![OTP](../img/lab-07-C/202311051201.png)

## Ejercicio 4. Crear una VM en Azure e instalar Evilginx

En Azure (o cualquier otro proveedor que permitar crear una VM con IP pública), creamos una instancia de un Ubuntu Server. Abrir los puertos 22, 80 y 443. Como usuario poner ***antonio*** y contraseña ***Pa55w.rd12345***.

Tomar la IP pública de la VM
```
PUBLIC_IP=<Poner aquí la IP Pública de la VM>
```

En una terminal de la máquina de Kali, escribimos.
```
ssh antonio@$PUBLIC_IP
```

Escribimos la contraseña
```
Pa55w.rd12345
```

Actualizamos los repositorios.
```
sudo apt update
```

Instalamos ***Git*** y el compilador de lenguaje ***Go***.
```
sudo apt install -y git golang-go
```

La documentación del proyecto la puedes encontrar en este sitio.
```
https://github.com/BakkerJan/evilginx2.git
```

Procedemos a clonar ***evilginx*** en la máquina virtual. En la terminal escribimos.
```
git clone https://github.com/BakkerJan/evilginx2.git
```

Entramos en la carpeta ***evilginx2***
```
cd evilginx2
```

Listamos el directorio
```
ls -l
```

El resultado es el siguiente. Observa como hay un archivo ***makefile***.

![ls](../img/lab-07-C/202311051749.png)

Esto significa que tenemos que preparar (compilar) la aplicación para que esta funcione. Neccesitamos instalar el comando ***make***. En la terminal, escribimos.
```
sudo apt install make 
```

y después.
```
make
```

Instalamos.
```
sudo make install
```

Iniciamos evilginx.
```
sudo evilginx
```

Ya hemos comprobado que la aplicación funciona, así que salimos de ella pulsando la tecla ***q***.

Como has visto, ***evilginx*** se lanza desde una terminal. Eso es un problema en Linux, ya que cuando cerremos la conexión ***ssh*** el proceso de evilginx también finalizará. Necesitamos pues algo que mantenga la terminal abierta aunque cerremos la conexión de ssh y, de esta forma, consiga que evilginx se mantenga funcionando todo el tiempo. Para ello usaremos ***screen***.

Instalamos ***screen***.
```
sudo apt install screen
```

Creamos una screen.
```
screen
```

Para listar las screens que tenemos, escribimos.
```
screen -list
```

En la imagen puedes ver cómo existe una screen  que es en la que nos encontramos, porque pone ***Attached***. En esta screen es en la que ejecutaremos evilginx.
![screen](../img/lab-07-C/202311231052.png)

Para volver a la terminal original, pulsamos la siguiente combinación de teclas ***CTRL + a*** y ***CTRL + d***.

Volvamos a listar las screens.
```
screen -list
```

Ahora ya no estamos dentro de esa screen, sino en la terminal original. Como puedes ver, la imagen nos dice que existe una screen pero no estamos conectados a ella.

![screen](../img/lab-07-C/202311231058.png)

Para entrar en la screen, ejecutamos el comando siguiente. Nota, el identificador de la screen será diferente. Usa el que te aparezca.
```
screen -r 7045.pts-0.evilginx
```

En esta screen lanzaremos evilginx, así que escribe el siguiente comando.
```
sudo evilginx
```

Como puedes ver, evilginx se ha iniciado.
![screen 2](../img/lab-07-C/202311231103.png)

Vamos a dejarlo corriendo en esta screen, así que salimos de ella con ***CTRL + a*** y ***CTRL + d***.

# Ejercicio 5: Crear un dominio de ataque y hacer que los servidores de zona apunten a evilginx.

Como hemos explicado al principio, el ataque se basa en conseguir que la víctima haga clic en un enlace que la lleve al servidor de evilginx. Por lo tanto, lo primero que debemos hacer es "contratar un dominio".

Para la autenticación con una cuenta de M365, el navegador del usuario conectará con ***login.microsoftonline.com***. Con la idea de engañar a la víctima y que no sospeche, intentaremos contratar un dominio que sea muy similar a este, observa la siguiente imagen.

![dominio disponible](../img/lab-07-C/202311231114.png)

Para la inmensa mayoría de los usuarios resultará imposible interpretar la diferencia entre.
```
login.microsoftonline.com
```

y
```
login.microsoft-on-line.com
```

El actor de la amenaza procederá a contratar dicho dominio. Para el resto del laboratorio, el dominio contratado no tiene como finalidad engañar al usuario y, además será fácilmente reconocible en esta práctica como dominio de ataque.

El dominio elegido es el siguiente
```
evilginx.antsala.xyz
```

Por lo que la DNS de ataque final tendría la forma de.
```
login.evilginx.antsala.xyz
```






***FIN DEL LABORATORIO***