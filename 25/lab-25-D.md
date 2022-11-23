# Ataques de Inyección SQL (SQL Injection).
      
      

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Ubu_srv_01***

Las debilidades de inyección permiten a los actores de la amenaza enviar código malicioso a través de la aplicación para atacar un sistema de backend. Estos ataque incluyen:

* Ejecutar comandos del sistema operativo por medio de llamadas al sistema (System calls)
* Abrir otros programas por medio de comandos de la shell.
* Relizar consultas a la base de datos de backend.
* etc.

Los ataques de inyección pueden presentarse cuando la aplicación utiliza alguna clase de interprete, que no filtra apropiadamente los datos enviados por el atacante.

Los ataques de inyección SQL pueden ser muy sencillos de explotar, pero también los tenemos muy elaborados y complejos. Las consecuencias de poder interactuar con el servidor de bases de datos son diversas, pueden modificar la información, corromperla o eliminarla.

## Hacer un pedido de la oferta especial de navidad de 2014.

La ***Blind SQL Injection*** es un tipo de ataque donde preguntamos a la base de datos (a ciegas) por consultas que pueden devolver ***true*** o ***false***, y estudiamos la respuesta. Este tipo de ataque se utiliza cuando la aplicación web está configurada para mostrar ***mensajes de error genéricos***, pero es vulnerable a inyección de SQL.

Cuando realizamos el ataque, la aplicación web puede mostrar errores  indicando que la sintaxis de la consulta es incorrecta.

***OBJETIVO***: Poder realizar un pedido de un producto que se supone que no está disponible.

***PISTAS***: 

* Localiza cómo oculta la aplicación a los usuarios los productos eliminados (que no se pueden pedir ya).
* Intenta construir una cadena de ataque que haga visible de nuevo esos productos eliminados.
* Selecciona un producto eliminado, añádelo al carrito y realiza el checkout.
* Ninguna de las pistas anteriores pueden ser realizadas desde el frontend de la aplicación y necesitan realizar ***Blind SQL Injection***.

***RESOLUCIÓN***. Los pasos para resolver el reto son.

Usaremos ***ZAP***, así que lo abrimos y conectamos a la siguiente URL.
Nota: Si no lo tienes claro o no lo conoces, te recomiendo hacer el laboratorio ***lab-25-A***.

```
http://192.168.20.60:3000/search
```

Vamos a estudiar una URL muy concreta. Para facilitar su localización, en el HUD, hacemos clic en ***History***, y filtramos por.
```
search
```

![Filtro](../img/lab-25-D/202211222021.png)

Esta request servirá para localizar productos. Como podemos ver, hace uso del parámetro ***p***. Ahora hacemos clic en la request que tenemos filtrada en el historial. Aparecerá un cuadro de diálogo que nos permite ver la ***Request*** original, así como la ***Response*** que se recibió. Si hacemos clic en la Response podeos observar cómo aparece la lista completa de productos devuelta desde la base de datos, tal y como se puede observar en la siguiente imagen.

![Datos](../img/lab-25-D/202211222041.png)

Si prefieres, puedes hacer que ZAP use el propio navegador para mostrar los datos devueltos. Para ello hacemos clic en el botón ***Replay in Browser***.

![Replay in Browser](../img/lab-25-D/202211222043.png)

Vamos a jugar con el parámetro ***p***, solicitando información sobre el zumo de limón. Para ello, en la barra de navegación, escribimos lo siguiente.
```
https://192.168.20.60:3000/rest/products/search?q=lemon
```

Podemos observar cómo se devuelven los datos para el producto con ***id=5***, que es el ***zumo de limón***.

![lemon](../img/lab-25-D/202211222046.png)

Aunque ZAP tiene herramientas automatizadas para probar si la inyección de SQL es posible, por ahora lo haremos manualmente. Si el interprete no filtra correctamente la entrada de usuario, es posible provocar errores. Vamos a usar caracteres que tienen significado en SQL, por ejemplo, ***'*** y ***;***. Escribimos en la URL del navegador lo siguiente.
```
https://192.168.20.60:3000/rest/products/search?q=';
```

Y obtendremos un bonito error del intérprete de SQL, demostrando que la inyección es posible.

![error SQL](../img/lab-25-D/202211222050.png)

Estamos a ciegas (blind). Sabemos que la aplicación es vulnerable, pero debemos construir consultas SQL cada vez más precisas, que lleven al objetivo buscado (Pedir un producto que no está en el stock). Realizamos otra prueba, escribiendo en en navegador la siguiente URL.
```
https://192.168.20.60:3000/rest/products/search?q='--
```

En este caso obtenemos un error ligeramente diferente: ***incomplete input***, que ocurre porque falta algún paréntesis en la consulta.

![Incomplete Input](../img/lab-25-D/202211222054.png)

Para arreglar el error, añadimos ***'))--***, así que en la barra de direcciones escribimos.
```
https://192.168.20.60:3000/rest/products/search?q='))--
```

Si observas, la aplicación devuelve otra vez la lista de productos, pero en este caso también muestra el producto descatalogado ***Christmas Super-Surprise-Box (2014 Edition)*** con ***id=10***.

![Christmas](../img/lab-25-D/202211222100.png)


Ahora procedemos a realizar el hackeo, consistente en hacer el pedido de este producto que está descatalogado. Para ello procedemos a realizar el login en la aplicación, de la forma que aprendimos a hacer. Si has cerrado en navegador, vuelve a la interfaz de ZAP y en ***Quick Start***, inicia una exploración manual en la URL siguiente.
```
http://192.168.20.60:3000/#/login
```

Inicia sesión con el usuario que has creado. Vamos a añadir un producto normal en el carrito, para evitar problemas cuando agregemos es que está descatalogado. Por ejemplo, agrega ***Lemon Juice (500ml)***.

![Lemon Juice](../img/lab-25-D/202211231924.png)

Ahora debemos localizar la request que agrega el zumo de limón al carrito. Para ello hacemos clic en ***History*** del ***HUD***, y localizamos la request a la URL ***http://192.168.20.60:3000/api/BasketItems/***. Hacemos clic en ella y podrás ver la información que la aplicación manda a la api del servidor, tal y como se muestra en la siguiente imagen.

![BasketId](../img/lab-25-D/202211231929.png)

Podrás comprobar que el ***ProductId*** es ***5***, que ***BasketId*** es ***6*** y ***quantity*** es ***1***.
Nota: ***BasketId*** puede mostrar un valor diferente al de este tutorial. Anótalo porque lo usarás en breve.

Ahora que ya sabemos el ID de nuestro carrito procedemos a reenviar la request modificando el ***id*** del producto que queremos obtener, y que no es otro que el famoso ***Christmas Super-Surprise-Box (2014 Edition)*** con ***id=10***.

En el cuadro de diálogo ***HTTP Message***, cambiamos el ***ProductId*** de ***5*** a ***10***. Debe quedar tal y como muestra la imagen.

![ProductId:10](../img/lab-25-D/202211231940.png)

Y procedemos a reenviar la request a la api haciendo clic en el botón ***Replay in Browser***. Con esto habremos añadido un producto que no se podía elegir en la aplicación.

![Reenvio request](../img/lab-25-D/202211231949.png)

Para volver a la aplicación, escribimos en la barra de direcciones la siguiente URL.
```
http://192.168.20.60:3000
```

Hacemos clic en el bótón del carrito y veremos como aparecen los dos productos. Ya solo quedaría finalizar el proceso de compra haciendo clic en ***Checkout***.

![Carrito](../img/lab-25-D/202211231952.png)










https://pwning.owasp-juice.shop/appendix/solutions.html

https://pwning.owasp-juice.shop/part2/injection.html





