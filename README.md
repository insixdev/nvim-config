# nvim-config

¡Bienvenido a mi configuración personal de Neovim!  
Este repositorio contiene todos los archivos necesarios para transformar tu experiencia de edición en Neovim, con un enfoque en productividad, facilidad de uso y personalización total usando **Lua**.

## 🚀 Características principales

- Plugins esenciales para desarrollo moderno (LSP, autocompletado, git, etc.)
- Temas y apariencia mejorados
- Atajos y mapeos personalizados para mayor velocidad
- Optimizaciones para rendimiento y comodidad

## ⚡️ Instalación rápida

> **Requisito previo:** Debes tener instalado [Neovim 0.7+](https://neovim.io/).

1. **Haz una copia de seguridad de tu configuración actual** (si la tienes):

    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```

2. **Clona este repositorio en tu carpeta de configuración de Neovim:**

    ```bash
    git clone https://github.com/insixdev/nvim-config.git ~/.config/nvim
    ```

3. **Abre Neovim**, los plugins se instalarán automáticamente (usa `:Lazy sync` si es necesario).

    ```bash
    nvim
    ```

4. **¡Listo!** Ya puedes disfrutar de tu nuevo entorno Neovim.

## 🛠️ Personalización

- Modifica cualquier archivo en `lua/` para ajustar la configuración a tus gustos.
- Agrega o elimina plugins desde el archivo de gestión de plugins.
- Puedes cambiar el esquema de colores, los atajos, y mucho más.

## 📦 Plugins principales incluidos

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- ...y más

## Configuracion propia
tienes que configurar obsidian y ir al path de tu propio obsidian 
o mismo desactivar el plugin si no lo utilizas
para 
lazyGit 

necesitas las herramientas de la terminal instaladas y funcionando 
## 💡 Consejos

- Consulta los archivos en `lua/` para ver cómo están organizados los módulos.
- Revisa los atajos personalizados en el archivo `mappings.lua`.
- Si tienes problemas con algún plugin, ejecuta `:Lazy sync` o revisa el archivo `init.lua`. en plugins/

## 🤝 Contribuciones

Esta configuración es personal, pero puedes abrir issues o pull requests si encuentras algún bug o tienes sugerencias.

## 📄 Licencia

MIT

---

¡Espero que disfrutes esta configuración y te ayude a ser más productivo con Neovim!
# Credits
Nvchad es la base 
Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
