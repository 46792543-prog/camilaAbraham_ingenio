# camilaAbraham_ingenio (cambiar el titulo)
## Descripcion 
laesperanza_ingenio.sql es una base de dato diseñada para gestionar el área del campo del ingenio La Esperanza, cuenta con el esquema relacional completo, las tablas necesarias, sus relaciones, claves primarias, claves foráneas y estructura normalizada. 

## 📌 1. Objetivo del Proyecto

El objetivo principal del proyecto es diseñar y desarrollar una base de datos que permita gestionar el área de campo del Ingenio Azucarero La Esperanza, perteneciente al Grupo Budeguer.
La base de datos busca organizar de forma eficiente:
Las máquinas agrícolas utilizadas en el ingenio.
Los empleados del área de campo.
Las tareas asignadas y realizadas.
Los agroquímicos utilizados.
Las horas de trabajo del personal.
La información necesaria para generar las liquidaciones mensuales.
El sistema garantiza orden, control y trazabilidad de los datos de producción y recursos humanos.

## 🧩 2. Actividades Principales del Sistema

El sistema permite:

✔ Gestión de máquinas

Registrar máquinas, mantenimiento, tipo, estado y disponibilidad.

✔ Gestión de empleados

Datos personales, cargo, área y estado laboral.

✔ Registro de tareas

Asignación de tareas, fechas, responsables y maquinaria utilizada.

✔ Control de agroquímicos

Tipos, cantidades, fechas de aplicación y campos donde se utilizan.

✔ Registro de horas trabajadas

Horas diarias por empleado para calcular la liquidación mensual.

✔ Generación de informes
.Consultas rápidas para:
  - Horas totales trabajadas
  - Tareas completadas
  - Maquinarias utilizadas
  - Insumos aplicados
## 🧩 Características principales
- Modelo de datos normalizado (hasta 3FN).
- Manejo completo de relaciones 1:N, N:M, y estructuras auxiliares.
- Uso de claves primarias, foráneas, índices y restricciones.
- Scripts SQL listos para ejecutar en MySQL.
- Compatible con MySQL Workbench (incluyendo diagramas EER).
- Pensada para integrarse a un sistema real de facturación, ventas y administración.

## Instalacion y Uso de la Base de datos

  **1. Clonar el repositorio**

Primero se debe descargar el proyecto completo desde GitHub:

git clone https://github.com/46792543-prog/camilaAbraham_ingenio

  **2. Instalar un gestor de base de datos**

Podés usar cualquiera de estos programas para trabajar con MySQL:
      phpMyAdmin
      Laragon
      XAMPP
      MySQL Workbench
      Terminal de MySQL
      
**Cualquiera funciona mientras tenga MySQL instalado.**
  **3. Crear la base de datos**

Abrí la terminal de MySQL y ejecutá:
   mysql -u root -p
Ingresás tu contraseña y luego creás la base:
   CREATE DATABASE coloquio;
   EXIT;

  **4. Importar el archivo SQL**

Ahora vas a cargar el archivo .sql que viene en el repositorio.

⚠️ Importante:
Tené en cuenta:
         el usuario y contraseña,
         el nombre de la base,
        la ubicación del archivo .sql.
  Ejemplo de importación desde la terminal:
      **mysql -u root -p coloquio < C:\ruta\tu_archivo.sql**
       
  **5. Verificar que las tablas se importaron bien**

Volvé a entrar a MySQL:
        mysql -u root -p
Luego seleccioná tu base:
USE coloquio;
SHOW TABLES;

Deberías ver todas tus tablas:
por ejemplo empleados, estado_familiar, ventas, productos, etc.
(Me decís los nombres reales y lo pongo tal cual.)

 **6. Consultas de prueba**

Para comprobar que todo funciona:

SELECT * FROM empleados LIMIT 10;
SELECT * FROM productos LIMIT 10;

  **7. Listo para usar**

Una vez importada la base, ya podés:
    - agregar registros,
    -modificar información,
    -realizar consultas,
    -usar triggers o automatizaciones si tu proyecto los incluye.


## 🏗️ 4. Diagrama de la Base de Datos 
<img width="1594" height="1155" alt="laesperanza_ingenio" src="https://github.com/user-attachments/assets/f07a7881-131d-415d-bdf1-934828aaabd5" />

## Conclusión

La base de datos desarrollada permite una gestión clara, organizada y eficiente del área de campo del Ingenio Azucarero.
Las tablas están correctamente relacionadas, facilitando la administración de empleados, máquinas, tareas, agroquímicos y registros de horas.
Además, el sistema sienta una base sólida para futuras mejoras o integración con una aplicación completa

## 🧑‍💻 7. Autor

Desarrollado por Camila Gaspar Abraham
Año 2025

## Catedra Base de Datos 2025





