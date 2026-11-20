# Dolores AR · Realidad aumentada en Flutter con TDD

**Materia:** Desarrollo de Aplicaciones Móviles
**Alumno:** González López Yael Isaac
**Fecha:** 6 de noviembre de 2026

## Descripción

App turística de realidad aumentada para Dolores Hidalgo. Con GPS, brújula y cámara calcula dónde estás y hacia dónde miras, y dibuja etiquetas flotando sobre los lugares (Parroquia, Museo de la Independencia, Nieves del Jardín, etc.) con su distancia. Al acercarte a menos de 40 m de un lugar ganas un sello en tu pasaporte turístico, y también puedes ver un modelo 3D sobre el piso. Toda la matemática (distancias con Haversine, rumbos, ángulos, campo de visión y suavizado de la brújula) se desarrolló con TDD, y tiene un modo demo para probarla en el salón sin estar en Dolores.

## Estructura del proyecto

![Estructura del proyecto](capturas/01_estructura.jpeg)

## Pruebas de casos (éxito y fallo)

## Pruebas de geometría (20) · test/geo_test.dart

Pruebas: distancia con Haversine (4), rumbo en grados (5), manejo de ángulos y cruce del 0°/360° (5), posición horizontal en el campo de visión (5) y formato de distancia (1).

### Éxito (todas en verde)

<img width="400" height="326" alt="image" src="https://github.com/user-attachments/assets/84bd8dce-7a68-4d18-a7d3-00f06f6ac66c" />

### Fallo (un grado de latitud mide unos 111.2 km)

<img width="403" height="326" alt="image" src="https://github.com/user-attachments/assets/860a8390-6d42-4d13-afb5-e4a9d68eb3d8" />

## Pruebas del motor AR (9) · test/motor_ar_test.dart

Pruebas: lugar adelante al centro, lugar a 90° no aparece, girar al este lo centra, desplazamiento al girar, radio máximo, cruce del 0°/360°, orden de lejanos a cercanos, tamaño según distancia y campo de visión más ancho.

### Éxito (todas en verde)

<img width="401" height="392" alt="image" src="https://github.com/user-attachments/assets/343ff60d-daa7-422f-af55-717a732c717f" />

### Fallo (un lugar justo adelante aparece en el centro de la pantalla)

<img width="403" height="401" alt="image" src="https://github.com/user-attachments/assets/82db8f54-5484-48c3-9490-137b267dbbca" />

## Pruebas del pasaporte (5) · test/pasaporte_test.dart

Pruebas: lejos no hay sello, a menos de 40 m se gana, exactamente 40 m cuenta, el sello se gana una sola vez y progreso de lugares visitados.

### Éxito (todas en verde)

<img width="401" height="353" alt="image" src="https://github.com/user-attachments/assets/ebc99666-567a-4bbb-8a4f-b13544e1e9b9" />

### Fallo (a menos de 40 m se gana el sello)

<img width="401" height="353" alt="image" src="https://github.com/user-attachments/assets/d42dd971-7785-4767-b303-4681e428fb6d" />

## Pruebas del ViewModel AR (8) · test/ar_viewmodel_test.dart

Pruebas: espera GPS y brújula, calcula visibles, actualiza al girar, suaviza la brújula, sello una sola vez, error de permiso amable, error desconocido sin detalles internos y notifica a la pantalla.

### Éxito (todas en verde)

<img width="396" height="216" alt="image" src="https://github.com/user-attachments/assets/01ce2396-5ada-4893-8403-4b506be470f5" />

### Fallo (un error desconocido NO filtra detalles internos)

<img width="404" height="424" alt="image" src="https://github.com/user-attachments/assets/2efa7d70-bb78-42fa-a06d-360fb69ad74e" />

## Todas las pruebas en verde (42)

![Todas las pruebas](capturas/05_pruebas_todas.jpeg)

## Evidencia de la aplicación

### Modo demo con etiquetas de realidad aumentada

![Modo demo](capturas/07_app_demo.jpeg)

### Sello conseguido en el pasaporte

![Pasaporte](capturas/11_app_pasaporte.jpeg)
