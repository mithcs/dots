----- START OF README -----

Higher Level TODO:
- Setup `flutter-tools` - *do not configure dartls manually*

## Softwares' configuration available in this repository:
<details>
<summary>awesomewm</summary>

[**awesomewm**](https://awesomewm.org/) is a highly configurable and fast tiling window manager. Configuration is done via **lua** language.

Using slightly modified **vertex** theme from [here](https://github.com/lcpz/awesome-copycats) with some awesome keybindings.
</details>

<details>
<summary>dunst</summary>

[**dunst**](https://dunst-project.org/) is a lightweight and customizable notification daemon.

Configured to look simple and neat.

</details>

<details>
<summary>thunar</summary>

[**thunar**](https://docs.xfce.org/xfce/thunar/start) is a modern file manager, designed for the Xfce Desktop Environment but works fine on every wm I tried.

Custom actions:
- **Create Archive**:
    Create an archive in 7z format
- **Extract Archive**:
    Extract archive(s)
- **Create Archive(zip)**:
    Create an archive in zip format
- **Extract to**:
    Extract the archive to its own folder

</details>

<details>
<summary>neovim</summary>
    
[**neovim**](https://neovim.io) is a hyperextensible **Vim-based** text editor. This is the solution I prefer for writing and managing all my code and configuration files. Even this README is written using neovim.

> 📝 Note: Auto-completion is disabled by default, enable it via <kbd>&lt;leader&gt;nt</kbd>

Plugins:
- **lazy.nvim**:
    For managing plugins
- **catppuccin**:
    For theming
- **cmp-nvim-lsp**:
    nvim-cmp source for built-in LSP client
- **Comment.nvim**:
    For quickly commenting code
- **mason.nvim**:
    For managing LSP servers. DAP, linters and formatters can also be managed through this
- **mason-lspconfig.nvim**:
    Extension to mason.nvim for lspconfig
- **nvim-autopairs**:
    For automatically pairing brackets, braces, quotes and more
- **nvim-cmp**:
    For autocomplete
- **nvim-colorizer**:
    For coloring hex-codes and more
- **nvim-lspconfig**:
    For managing LSP servers easily
- **nvim-treesitter**:
    For syntax highlighting
- **plenary.nvim**:
    Dependency for many cool plugins
- **telescope.nvim**:
    For jumping from one place to another easily
- **telescope-undo.nvim**:
    For good undo-ing integrated with telescope.nvim

</details>

<details>
<summary>rofi</summary>

**rofi** is used as application launcher, and so much more.

Using theme designed by [adi1090x](https://github.com/adi1090x/rofi) with some modifications. And dracula.rasi.

Required by several scripts too.

</details>

<details>
<summary>simple terminal</summary>

**simple terminal** is a simple terminal implementation for X. It does what a terminal should do. It is written in C, and can be extended by patches. Several patches are applied and I do not remember all of them to list here.

</details>

<details>
<summary>zsh</summary>

**zsh** or **Z shell** is used as an alternative to bash. It offers some awesome features. **prezto** framework is used for managing zsh configuration. Current theme is **kylewest**.

Several helpful aliases and so much more is set in `zshrc`.

</details>

<details>
<summary>System Information</summary>

TODO

</details>

### TODO:
- [ ] Write about tools which are not used now, but were used and exists in the repository
- [ ] Add System Information
- [ ] Modularize awesomewm config file
- [ ] Document other things like GTK theme and more...
- [ ] Document `SymLinker.sh`
- [ ] Document `config.toml` - config file for greetd at /etc/greetd/

Last updated: 14-12-2024;



----- END OF README -----
