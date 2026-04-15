# Dani Nvim

Starter de Neovim pensado para:

- sentirse cercano a VSCode
- ser liviano en una laptop de 4 GB RAM
- seguir la paleta del resto del sistema
- no depender de Nerd Fonts
- incluir Copilot desde el inicio

## Primer arranque

1. Abre `nvim`.
2. Espera a que `lazy.nvim` descargue los plugins.
3. Ejecuta `:Copilot setup` una sola vez y autentícate.

## Atajos base

| Tecla | Acción |
| --- | --- |
| `Space` | Leader / menú de atajos |
| `Ctrl+S` | Guardar |
| `Ctrl+P` | Buscar archivo |
| `Space e` | Explorador de archivos |
| `Space ff` | Buscar archivo |
| `Space fg` | Buscar texto |
| `Space fr` | Archivos recientes |
| `Space fb` | Buffers |
| `Space /` | Buscar dentro del archivo actual |
| `Space tt` | Terminal flotante |
| `Space w` | Guardar |
| `Space q` | Cerrar ventana |
| `Tab` | Aceptar sugerencia de Copilot |
| `Ctrl+Space` | Abrir completion |
| `gd` | Ir a definición |
| `gr` | Referencias |
| `gi` | Implementación |
| `K` | Hover |
| `Space rn` | Renombrar |
| `Space ca` | Code action |
| `Space ld` | Diagnóstico de línea |

## Lenguajes

Mason instala LSPs para Lua, Python, Bash, JSON, YAML, HTML, CSS, TypeScript, C/C++, Go, Rust, Java y Kotlin.

## Notas

- El tema es propio: `dani`.
- `:Lazy` abre el gestor de plugins.
- `:Mason` muestra herramientas/LSPs.
- `:checkhealth` sirve para diagnosticar problemas.

