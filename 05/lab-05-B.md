# Herramientas de evaluación de vulnerabilidades.
  

Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Metasploitable3-ub1404***.
4. Máquina ***Metasploitable3-win2k8***.
5. Maquina ***GSM-Trial Open VAS*** (A descargar de Internet)


Como habrás comprobado no resulta demasiado práctico buscar manualmente las vulnerabilidades en las webs especializadas. Necesitamos automatizar este proceso.

En el mercado existen diversas herramientas que realizan toda esta labor. Algunas gratuitas, otras comerciales. En este laboratorio vamos a estudiar algunas de las más conocidas y usadas en el sector.

## Ejercicio 1: Open VAS.

Se trata de un escáner de vulnerabilidad completo que inicialmente era un proyecto de ***Open Source***. Hoy en día es una poderosa herramienta ***Comercial***. 

Podemos evaluar la versión completa durante 14 días. Para ello vamos a descargar una máquina virtual para ***Virtual Box***.

En tu máquina ***física*** conéctate a la siguiente URL.
```
https://www.greenbone.net/en/testnow/#downloadnow
```

El la captura puedes ver las instrucciones de instalación, así como el formulario que hay que rellenar para evaluar el producto.
Nota: Antes de empezar la instalación, sigue leyendo las ***Notas para la instalación***.

![Open VAS](../img/lab-05-B/202209131038.png)

***Notas para la instalación***.

Si no se especifica nada, usar la opción por defecto.

Cuando la hayas importado, antes de iniciarla, conéctala a la red ***laboratorio***.

![Red laboratorio](../img/lab-05-B/202209131045.png)

En la red ***laboratorio*** no hay ***servidor DHCP***, así que en el asistente de instalación debemos saltarlos la parte de comprobación de la conexión de red, hasta que podamos poner una IP manualmente.

![Skip Network](../img/lab-05-B/202209131052.png)

El asistente nos pide la ***Clave de Subscripción*** para poder actualizar la base de datos de vulnerabilidades. Esta clave se obtiene al registrar la demo de 14 días. Por comodidad, ***Saltamos*** este paso porque la base de datos que trae por defecto es más que suficiente para evaluar el producto, así que seleccionamos ***Skip***.

Ahora vamos a cofigurar la red. elegimos ***Setup***.

![Network](../img/lab-05-B/202209131101.png)

Luego ***Network***.

![Network](../img/lab-05-B/202209131103.png)

Seleccionamos ***Interfaces***

![Network](../img/lab-05-B/202209131105.png)

Seleccioamos ***Static IP***.

![Network](../img/lab-05-B/202209131106.png)













