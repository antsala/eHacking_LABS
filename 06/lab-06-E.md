# Ocultar el rastro y eliminación de pruebas.
 Los ejercicios a realizar son:
   - ******.
      
Requisitos:
1. Máquina ***Router-Ubu***.
2. Máquina ***Kali Linux***.
3. Máquina ***Windows 11***


Para permanecer no detectados, el actor de la amenaza necesita eliminar todas las evidencias de su actividad delictiva. Para conseguirlo, debe modificar o eliminar logs del sistema.

Esta eliminación puede realizarse de forma manual o asistida por herramientas especializadas.

En este laboratorio conoceremos los procedimientos más habituales para evitar el rastreo.

## Ejercicio 1: Auditpol en Windows.

En ***Windows*** la herramienta ***auditpol*** se utiliza para configurar las políticas de auditoría. Si bien en una organización esta política se configura de manera centralizada por la ***Directiva de Grupo***, en esta práctica la haremos de forma local.

En la máquina ***Win 11*** abrimos un terminal de comandos en modo ***administrador***.
Nota: Una ***terminal de comandos***, no de ***PowerShell***.

En ella escribimos.
```
auditpol /get /category:*
```

Este comando permite comprobar qué tipo de auditoría se está registrando en el sistema.
Nota: La auditoría de ***Object Access*** es la que registra el acceso a los ***Archivos***.

![auditpol](../img/lab-06-E/202209181059.png)



