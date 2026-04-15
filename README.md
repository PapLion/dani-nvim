# Dani Nvim

Starter de Neovim minimalista, rápido y beginner-friendly para Arch Linux.

Pensado para:

- sentirse cercano a VSCode
- ser liviano en una laptop de 4 GB RAM
- seguir la paleta del resto del sistema
- no depender de Nerd Fonts ni de iconos rotos
- incluir Copilot desde el inicio

## Qué incluye

- `lazy.nvim` como gestor de plugins
- Copilot listo para usarse
- `Telescope` con file browser para archivos, carpetas, texto, buffers y ayuda
- `Mason` + LSP + `Treesitter`
- `Trouble`, `persistence`, `diffview` y `fugitive`
- `bufferline`, `lualine`, `which-key`, `dressing`, `toggleterm`
- tema propio: `dani`

## Primer arranque

1. Abre `nvim`.
2. Espera a que `lazy.nvim` descargue los plugins.
3. Ejecuta `:Copilot setup` una sola vez y autentícate.

## Instalación desde GitHub

```bash
gh repo clone PapLion/dani-nvim ~/.config/nvim
```

Luego abre `nvim` y deja que `lazy.nvim` termine de instalar todo.

## Uso diario

1. `Space e` abre el explorador de archivos.
2. `Space ff` busca archivos.
3. `Space fd` busca directorios.
4. `Space fg` busca texto en todo el proyecto.
5. `Space fb` muestra buffers abiertos.
6. `Space gs` abre el estado de Git.
7. `Space tt` abre la terminal flotante.

## Atajos base

| Tecla | Acción |
| --- | --- |
| `Space` | Leader / menú de atajos |
| `Ctrl+S` | Guardar |
| `Ctrl+P` | Buscar archivo |
| `Space e` | Explorador de archivos |
| `Space ff` | Buscar archivo |
| `Space fd` | Buscar directorio |
| `Space fg` | Buscar texto |
| `Space fr` | Archivos recientes |
| `Space fb` | Buffers |
| `Space gs` | Estado de Git |
| `Space gf` | Archivos Git |
| `Space gB` | Ramas Git |
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
| `Space xx` | Diagnósticos |
| `Space xw` | Diagnósticos del buffer |
| `Space xl` | Lista de ubicaciones |
| `Space xq` | Lista de quickfix |
| `Space ss` | Guardar sesión |
| `Space sl` | Restaurar última sesión |
| `Space sd` | Restaurar sesión del directorio |

## Lenguajes

Mason instala LSPs para Lua, Python, Bash, JSON, YAML, HTML, CSS, TypeScript, C/C++, Go, Rust, Java y Kotlin.

## Actualizaciones

- `:Lazy update` actualiza los plugins.
- `:Mason` abre el gestor de LSPs y herramientas.
- `:Git` abre Fugitive.
- `:Trouble` abre el panel de diagnósticos.
- Cierra y vuelve a abrir Neovim después de una actualización grande para que cargue todo limpio.
- `git pull` actualiza el repo si lo clonaste desde GitHub.

## Notas

- El tema es propio: `dani`.
- `:Lazy` abre el gestor de plugins.
- `:Mason` muestra herramientas/LSPs.
- `:checkhealth` sirve para diagnosticar problemas.
- `:messages` ayuda a ver errores recientes.
