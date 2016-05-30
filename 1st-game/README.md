# Golden Balls

## Desarrollo

Para el desarrollo sigue los siguientes pasos:

### Crea un nuevo directorio/carpeta

```
$ mkdir 1st-game
```

### Crear el archivo de configuración de elm

```json
{
    "version": "1.0.0",
    "summary": "Este va a ser el primer videojuego :)",
    "repository": "https://github.com/lambda-games/lambda-games.git",
    "license": "MIT",
    "source-directories": [
        "src"
    ],
    "exposed-modules": [],
    "dependencies": {
        "elm-lang/core": "4.0.1 <= v < 5.0.0",
        "elm-lang/html": "1.0.0 <= v < 2.0.0"
    },
    "elm-version": "0.17.0 <= v < 0.18.0"
}
```

### Cargar las dependencias

Ejecuta el comando para gestionar las dependencias de Elm

```
$ elm-package install
```

NOTA: Si solo clonaste este proyecto solo tendrías que realizar el último paso :)

## Ejecutar el juego

Ejecuta el comando `elm-reactor` desde el directorio del proyecto. Luego abre el
navegador. Se mostrará una ventana con los archivos y directorios del proyecto.
Abre el directorio `src` y selecciona el archivo `Main.elm`. Espera unos segundos.
Y empieza a jugar ;)

## TODO

- Documentar: ¿Cómo jugar?

