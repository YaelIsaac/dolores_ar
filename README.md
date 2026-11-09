# Dolores AR · Realidad aumentada para visitar Dolores Hidalgo (TDD)

**Materia:** Desarrollo Móvil Integral
**Universidad:** UTNG, Dolores Hidalgo
**Alumno:** González López Yael Isaac
**Fecha:** 6 de Noviembre de 2026

## Descripción

App turística con dos tipos de realidad aumentada. La **RA por ubicación** usa GPS, brújula y cámara: las matemáticas (distancia de Haversine, rumbo, diferencia angular, campo de visión) deciden qué lugares se ven y en qué parte de la pantalla. La **RA de superficie** coloca un modelo 3D sobre el piso o una mesa con `model_viewer_plus`. Incluye un pasaporte turístico con sellos y un **modo demo** que funciona sin GPS gracias a que el ViewModel depende de contratos (`FuentePosicion` y `FuenteBrujula`), no de plugins.

## Estructura del proyecto
![Estructura del proyecto](capturas/01_estructura.jpeg)


### Pruebas de geometría (`geo_test.dart`)
![Pruebas de geometría](capturas/02_pruebas_geo.jpeg)


### Pruebas del motor y del pasaporte
![Pruebas del motor](capturas/03_pruebas_motor.jpeg)


### Pruebas del ViewModel
![Pruebas del ViewModel](capturas/04_pruebas_viewmodel.jpeg)


### Todas las pruebas en verde
![Todas las pruebas](capturas/05_pruebas_todas.jpeg)


## Evidencia de la aplicación

### Pantalla de inicio con aviso de seguridad y privacidad
![Pantalla de inicio](capturas/06_app_inicio.jpeg)


### Modo demo: etiquetas flotando sobre el fondo
![Modo demo](capturas/07_app_demo.jpeg)


### Girando el deslizador cambian los lugares que se ven
![Rumbo distinto](capturas/08_app_demo_giro.jpeg)


### Pasaporte con palomitas en la lista de lugares
![Pasaporte](capturas/11_app_pasaporte.jpeg)
