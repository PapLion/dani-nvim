# Dani Nvim

Neovim starter text-first para Arch Linux, pensado para ser rápido, beginner-friendly y estable en hardware modesto. Usa la paleta real del sistema, no depende de Nerd Fonts y prioriza flujos simples que no rompan el editor.

## Incluye

- `lazy.nvim` como gestor
- `snacks.nvim` para dashboard y notificaciones
- `neo-tree`, `telescope`, `which-key`
- `blink.cmp`, `mason.nvim`, `nvim-lspconfig`, `conform.nvim`, `nvim-lint`
- `gitsigns`, `lazygit.nvim`, `diffview.nvim`
- `nvim-treesitter`, `toggleterm.nvim`, `todo-comments.nvim`, `trouble.nvim`
- tema custom `dani` basado en la paleta de i3

## Primer arranque

1. Clona el repo en `~/.config/nvim`.
2. Abre `nvim`.
3. Deja que `lazy.nvim` instale todo.
4. Si hace falta, revisa `:Mason` para los servidores/formateadores.

## Navegación diaria

| Tecla | Acción |
| --- | --- |
| `Space e` | Toggle explorer |
| `Space o` | Focus explorer |
| `Space ff` | Buscar archivos |
| `Space fg` | Live grep |
| `Space fb` | Buffers |
| `Space fr` | Archivos recientes |
| `Space fp` | Switch de proyectos |
| `Space gs` | LazyGit |
| `Space gd` | Diffview |
| `Space gD` | Close Diffview |
| `Space gb` | Git blame |
| `Space gB` | Git branches |
| `Space gS` | Git status |
| `Space xx` | Diagnósticos |
| `Space xw` | Diagnósticos del buffer |
| `Space xl` | Location list |
| `Space xq` | Quickfix |
| `Space tt` | Terminal flotante |
| `Tab` / `Shift+Tab` | Siguiente / anterior buffer |
| `Ctrl+O` / `Ctrl+I` | Jump back / forward |
| `Space ch` | Cheatsheet de atajos |

## Uso rápido

- `:Lazy` abre el gestor de plugins.
- `:Lazy update` actualiza la base.
- `:Mason` gestiona LSPs y herramientas.
- `:Neotree toggle` abre el explorador.
- `:Trouble` abre diagnósticos.
- `:LazyGit` abre Git.

## Arquitectura

```text
~/.config/nvim/
├── init.lua
├── lua/
│   ├── config/
│   │   ├── lazy.lua
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   └── autocmds.lua
│   ├── plugins/
│   │   ├── ui.lua
│   │   ├── editor.lua
│   │   ├── lsp.lua
│   │   ├── completion.lua
│   │   ├── git.lua
│   │   ├── treesitter.lua
│   │   └── tools.lua
│   ├── community.lua
│   └── polish.lua
```

## Notas

- El root del proyecto se detecta por `.git`.
- El tema usa la paleta del sistema y ajustes derivados, no colores aleatorios.
- Si quieres refrescar el setup completo, ejecuta `:Lazy sync` y reinicia Neovim.
