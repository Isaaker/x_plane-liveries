# MCDU A320 X-Plane

Este proyecto tiene como objetivo crear una MCDU (Multi-Function Control Display Unit) para el simulador X-Plane, específicamente para el modelo Toliss A320 Neo. La MCDU se puede visualizar a través de un navegador web en dispositivos como iPhone y iPad, proporcionando una interfaz interactiva y realista.

## Estructura del Proyecto

El proyecto está organizado de la siguiente manera:

```
mcdu-a320-xplane
├── src
│   ├── web
│   │   ├── index.html          # Página principal de la MCDU
│   │   ├── styles              # Carpeta que contiene los estilos CSS
│   │   │   └── main.css        # Estilos para la MCDU
│   │   ├── scripts             # Carpeta que contiene los scripts JavaScript
│   │   │   └── mcdu.js         # Lógica de la MCDU y manejo de datarefs
│   │   └── components          # Componentes específicos de la interfaz
│   │       └── display.js      # Visualización de datos y botones interactivos
│   ├── lua                     # Scripts Lua para la comunicación con X-Plane
│   │   └── mcdu_datarefs.lua   # Interacción con los datarefs de X-Plane
│   ├── cpp                     # Código C++ para el plugin de X-Plane
│   │   └── mcdu_plugin.cpp     # Integración de la MCDU con el simulador
│   └── types                   # Definición de tipos y interfaces
│       └── index.ts            # Tipos utilizados en el proyecto
├── package.json                # Configuración de npm
├── tsconfig.json               # Configuración de TypeScript
└── README.md                   # Documentación del proyecto
```

## Instalación

1. Clona este repositorio en tu máquina local.
2. Navega a la carpeta del proyecto.
3. Ejecuta `npm install` para instalar las dependencias necesarias.

## Uso

1. Asegúrate de tener X-Plane y el modelo Toliss A320 Neo instalados.
2. Carga el plugin de la MCDU en X-Plane.
3. Abre el archivo `index.html` en un navegador web en tu iPhone o iPad.
4. Interactúa con la MCDU a través de la interfaz web.

## Contribuciones

Las contribuciones son bienvenidas. Si deseas mejorar el proyecto, por favor abre un issue o envía un pull request.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.