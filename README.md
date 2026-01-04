# Mi Configuración de Neovim

¡Bienvenido a mi configuración personal de Neovim! Este repositorio contiene todos los archivos necesarios para transformar tu experiencia de edición en Neovim, con un enfoque en productividad, facilidad de uso y personalización total usando **Lua**.

## 🚀 Características Principales

-   **Gestor de Plugins Moderno:** Usa [lazy.nvim](https://github.com/folke/lazy.nvim) para una gestión de plugins rápida y sencilla.
-   **Interfaz de Usuario Mejorada:** Integración con [Lualine](https://github.com/nvim-lualine/lualine.nvim), [Buffer-list](https://github.com/stylemistake/buffer-list.nvim), [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) y temas como [Tokyonight](https://github.com/folke/tokyonight.nvim) y [Rosé Pine](https://github.com/rose-pine/neovim).
-   **Búsqueda Inteligente:** Potenciado por [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) y [fzf](https://github.com/junegunn/fzf) para búsquedas rápidas en archivos, buffers y más.
-   **Soporte LSP:** Configuración completa para el Language Server Protocol con [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) y [Mason](https://github.com/williamboman/mason.nvim) para la instalación automática de servidores de lenguaje.
-   **Resaltado de Sintaxis Avanzado:** Con [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) para un resaltado de código más preciso y rápido.
-   **Integración con Git:** Usa [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) y [LazyGit](https://github.com/jesseduffield/lazygit) para una experiencia fluida con Git directamente desde Neovim.

## 📋 Requisitos Previos

Antes de instalar, asegúrate de tener los siguientes requisitos:

1.  **[Neovim](https://neovim.io/) 0.8+**
2.  **[Git](https://git-scm.com/)**
3.  **Compilador de C y `make`**: Necesario para `nvim-treesitter`.
    ```bash
    # En sistemas basados en Debian/Ubuntu
    sudo apt-get install build-essential
    # En sistemas basados en Arch
    sudo pacman -S base-devel
    # En macOS (con Homebrew)
    xcode-select --install
    ```
4.  **[Nerd Font](https://www.nerdfonts.com/font-downloads)**: Necesario para que los iconos se muestren correctamente. Instala una Nerd Font y configúrala en tu terminal.
5.  **[ripgrep](https://github.com/BurntSushi/ripgrep)**: Para búsquedas rápidas en el contenido de los archivos.
    ```bash
    # En sistemas basados en Debian/Ubuntu
    sudo apt-get install ripgrep
    # En sistemas basados en Arch
    sudo pacman -S ripgrep
    # En macOS (con Homebrew)
    brew install ripgrep
    ```
6.  **[fd](https://github.com/sharkdp/fd)**: Para búsquedas rápidas de archivos.
    ```bash
    # En sistemas basados en Debian/Ubuntu
    sudo apt-get install fd-find
    # En sistemas basados en Arch
    sudo pacman -S fd
    # En macOS (con Homebrew)
    brew install fd
    ```
7.  **[fzf](https://github.com/junegunn/fzf)**: Para la búsqueda difusa.
    ```bash
    # En sistemas basados en Debian/Ubuntu
    sudo apt-get install fzf
    # En sistemas basados en Arch
    sudo pacman -S fzf
    # En macOS (con Homebrew)
    brew install fzf
    ```
8.  **[lazygit](https://github.com/jesseduffield/lazygit)** (Opcional): Si usas la integración con LazyGit.
9.  **[Rust](https://www.rust-lang.org/tools/install)** (Opcional): Si desarrollas en Rust y quieres usar `rust_analyzer`. -> fff mejor motor de busqueda

## ⚡️ Instalación Rápida

1.  **Haz una copia de seguridad de tu configuración actual** (si la tienes):
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```
2.  **Clona este repositorio en tu carpeta de configuración de Neovim:**
    ```bash
    git clone https://github.com/insixdev/nvim-config.git ~/.config/nvim
    ```
3.  **Abre Neovim**, los plugins se instalarán automáticamente.
    ```bash
    nvim
    ```

## 📦 Post-Instalación

Al abrir Neovim por primera vez, `lazy.nvim` instalará automáticamente todos los plugins.

-   Si algún plugin no se instala correctamente, puedes ejecutar `:Lazy sync` para forzar la sincronización.
-   Para asegurarte de que todo funciona correctamente, ejecuta `:checkhealth`.

## 🛠️ Personalización

-   **Añadir o eliminar plugins:** Modifica el archivo `lua/plugins/init.lua`.
-   **Configuración de plugins:** La mayoría de las configuraciones de los plugins se encuentran en `lua/configs/`.
-   **Atajos de teclado:** Revisa y personaliza los atajos en `lua/mappings.lua`.
-   **Temas:** Cambia el tema en `lua/configs/themes.lua`.

## 🧩 Plugins Principales

| Plugin                                                              | Descripción                               |
| ------------------------------------------------------------------- | ----------------------------------------- |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Resaltado de sintaxis avanzado.           |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)          | Configuración para el LSP de Neovim.      |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                     | Motor de autocompletado.                  |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)  | Búsqueda difusa para archivos, buffers y más. |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)          | Barra de estado personalizable.           |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)          | Indicadores de Git en el gutter.          |

## 🔧 Configuraciones Específicas

### Obsidian

Si usas [Obsidian](https://obsidian.md/), tienes que configurar la ruta a tu vault en `lua/configs/obsidian.lua`. Si no lo usas, puedes desactivar el plugin comentando la línea correspondiente en `lua/plugins/init.lua`.

### LazyGit

Para usar la integración con LazyGit, asegúrate de tenerlo instalado y accesible desde tu terminal.

## 💡 Consejos

-   Consulta los archivos en `lua/` para ver cómo están organizados los módulos.
-   Revisa los atajos personalizados en el archivo `mappings.lua`.
-   Si tienes problemas con algún plugin, ejecuta `:Lazy sync` o revisa el log de `lazy.nvim`.

## 🤝 Contribuciones

Esta configuración es personal, pero puedes abrir issues o pull requests si encuentras algún bug o tienes sugerencias.

## 📄 Licencia

MIT

---

¡Espero que disfrutes esta configuración y te ayude a ser más productivo con Neovim!

## Créditos

-   **NvChad:** La base de esta configuración.
-   **LazyVim Starter:** Inspiración para la estructura y organización.
