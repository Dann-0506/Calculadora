# Calculadora Multi-Función (Flutter)

Este proyecto representa uno de mis primeros acercamientos al desarrollo multiplataforma utilizando **Flutter**. Fue concebido como un proyecto práctico para consolidar conceptos fundamentales de diseño de interfaces de usuario y gestión de estado. 

A pesar de ser un desarrollo temprano, la aplicación cuenta con una arquitectura organizada, separando la lógica de la interfaz y permitiendo una base escalable.

## Características Implementadas

La aplicación no se limita a operaciones básicas, sino que incorpora distintos módulos funcionales:
*   **Calculadora Básica y Científica:** Dos modos de operación separados para cálculos cotidianos y avanzados.
*   **Conversor de Unidades:** Una herramienta extra para transformaciones rápidas.
*   **Historial de Operaciones:** Un registro que permite revisar los cálculos realizados anteriormente.
*   **Soporte Multi-Tema:** Implementación nativa de temas claro y oscuro (`light_themes.dart`, `dark_themes.dart`) adaptables desde la configuración.

## Tecnologías y Estructura

*   **Framework:** [Flutter](https://flutter.dev/) / Dart.
*   **Gestión de Estado:** Utilización de controladores (`calculator_controller.dart`) y Providers (`theme_provider.dart`) para separar la lógica matemática y visual de la capa de UI.
*   **Diseño Modular:** El código fuente está estructurado en carpetas lógicas: `pages/`, `widgets/`, `logic/`, `themes/` y `providers/`.

## Instalación y Ejecución

Para correr este proyecto en tu entorno local, asegúrate de tener el SDK de Flutter instalado.

1. Clona este repositorio:
   ```bash
   git clone [https://github.com/tu-usuario/tu-repo-calculadora.git](https://github.com/tu-usuario/tu-repo-calculadora.git)
   ```
2. Instala las dependencias necesarias:
   ```bash
   flutter pub get
   ```
4. Ejecuta la aplicación en tu emulador o dispositivo físico:
   ```bash
   flutter run
   ```
## Capturas de Pantalla
  WIP
