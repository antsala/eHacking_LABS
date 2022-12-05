# Exposición de datos sensibles (***Sensitive Data Exposure***).

     

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Ubu_srv_01***

Los documentos que son accesibles debido a vulnerabilidades o malas configuraciones son de incalculable valor para el actor de la amenaza. Además de la información que podría tener el propio documento, puede ofrecer pistas para conseguir mayores objetivos.

## Ejercicio 1: Registrar a un usuario con privilegios de administrador. 

***OBJETIVO***: Conseguir que un usuario convencional acceda a la parte de administración de la aplicación.

***PISTAS***: 

* Estudia la Request/Response que se genera cuando se registra un nuevo usuario. 
* Reenvía la request cambiando algún parámetro.

***RESOLUCIÓN***. Los pasos para resolver el reto son.

Como siempre iniciamos ***ZAP***.

Realiza con ZAP una exploración manual sobre la siguiente URL.
```
http://192.168.20.60:3000
```

A continuación registra un nuevo usuario, tal y como se muestra en la imagen.
(Nota: observa la URL en la que se crea el usuario)

![Register](../img/lab-25-G/202212051046.png)

Pulsa el botón para crear el usuario.

Intenta entrar en la sección ***Administration***, escribiendo la siguiente URL en la barra de direcciones.
(Nota: Esta sección se descubrió en el ***Ejercicio 2*** del laboratorio ***lab-25-C***)
```
http://192.168.20.60:3000/#/administration
```

![403](../img/lab-25-G/202212051116.png)


A continuación, accede a ZAP y localiza en el historial, la request que registró al usuario. Esta request es de tipo ***POST***.

![Request POST](../img/lab-25-G/202212051050.png)

En la Request puedes observar los campos que se envían al servidor para crear al nuevo usuario.

![Request](../img/lab-25-G/202212051051.png)

Y la response indica que el ***role*** del usuario es ***customer***.

![Response](../img/lab-25-G/202212051053.png)

Hacemos clic derechos en la request anterior y elegimos ***Open/Resend with Request Editor*** para editarla.

Modifica los parámetros hasta que tengan la siguiente forma.

![Otra Request](../img/lab-25-G/202212051101.png)

Hacemos clic en el botón ***Send***.

En la respuesta podrás ver que la API ha aceptado la creación del usuario de esta forma tan simple.

![Otra Response](../img/lab-25-G/202212051102.png)

Observa como la response es aceptada ***success***. Mira también los valores para los campos ***email*** (otraprueba@gmail.com) y ***role*** (admin). El password es el que pusiste.


***FIN DEL LABORATORIO***

Admin Registration	Register as a user with administrator privileges.	⭐⭐⭐
Deluxe Fraud	Obtain a Deluxe Membership without paying for it.	⭐⭐⭐
Expired Coupon	Successfully redeem an expired campaign coupon code.	⭐⭐⭐⭐
Missing Encoding	Retrieve the photo of Bjoern's cat in "melee combat-mode".	⭐
Payback Time	Place an order that makes you rich.	⭐⭐⭐
Poison Null Byte	Bypass a security control with a Poison Null Byte to access a file not meant for your eyes.	⭐⭐⭐⭐
Repetitive Registration	Follow the DRY principle while registering a user.	⭐
Upload Size	Upload a file larger than 100 kB.	⭐⭐⭐
Upload Type	Upload a file that has no .pdf or .zip extension.	⭐⭐⭐
Zero Stars	Give a devastating zero-star feedback to the store.	⭐

https://pwning.owasp-juice.shop/part2/sensitive-data-exposure.html

https://pwning.owasp-juice.shop/appendix/solutions.html

