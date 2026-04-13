README - Instrucciones de ejecución

Este repositorio contiene pruebas automatizadas de API con Karate Framework sobre la API pública de PetStore.

==================================================
1. Requisitos previos
==================================================

Antes de ejecutar el proyecto, se debe tener instalado:

- Java JDK 17
- Apache Maven 3.8.6 o superior
- Git (solo si se va a clonar el repositorio)
- Conexión a internet

==================================================
2. Verificar instalaciones
==================================================

2.1. Verificar Java

Abrir una terminal o consola y ejecutar:

java -version

Resultado esperado:
Debe mostrarse una versión 17 de Java instalada.

2.2. Verificar Maven

Abrir una terminal o consola y ejecutar:

mvn -version

Resultado esperado:
Debe mostrarse Maven instalado correctamente.

==================================================
3. Clonar el repositorio
==================================================

Ejecutar en consola:

git clone https://github.com/FabricioAlama2001/api-karate.git

Luego ingresar a la carpeta del proyecto:

cd api-karate

Nota:
Si el nombre de la carpeta cambia al clonar, ingresar al nombre real del repositorio descargado.

==================================================
4. Ejecutar las pruebas desde consola
==================================================

Una vez ubicado en la raíz del proyecto, ejecutar:

mvn clean test

Este comando realiza lo siguiente:
- limpia archivos generados anteriormente
- descarga dependencias si es la primera ejecución
- ejecuta todas las pruebas automatizadas del proyecto

==================================================
5. Resultado esperado
==================================================

Si la ejecución es correcta, Maven mostrará en consola el resultado de las pruebas ejecutadas y el proceso finalizará exitosamente.

Las pruebas automatizadas validan el siguiente flujo:
- crear una mascota
- consultar una mascota por ID
- actualizar el nombre y estado de la mascota
- consultar mascotas por estado "sold"

==================================================
6. Ubicación de reportes
==================================================

Después de la ejecución, los reportes se generan dentro de la carpeta:

target/

Según la ejecución, pueden encontrarse en rutas como:
- target/karate-reports/
- target/surefire-reports/

En el repositorio también se adjunta una captura del reporte generado como evidencia.

==================================================
7. Ejecución desde IntelliJ IDEA
==================================================

Si se desea ejecutar el proyecto desde IntelliJ IDEA, seguir estos pasos:

1. Abrir IntelliJ IDEA.
2. Seleccionar la opción para abrir un proyecto existente.
3. Abrir la carpeta raíz del proyecto clonado.
4. Esperar a que Maven descargue las dependencias.
5. Ubicar la clase:
   src/test/java/petstore/PetStoreRunner.java
6. Ejecutar la clase como prueba JUnit.

==================================================
8. Configuración del proyecto
==================================================

La URL base de la API está definida en el archivo:

src/test/resources/karate-config.js

Valor configurado:
https://petstore.swagger.io/v2

==================================================
9. Observaciones
==================================================

- El proyecto utiliza Java 17.
- El framework usado es Karate versión 1.4.1.
- El proyecto se ejecuta con Maven.
- La API usada es pública, por lo que se requiere conexión a internet para ejecutar las pruebas.