-- init.lua
---------------------------------------------

-- Global options
require('core.options')

-- Keymaps
require('core.keymaps')

-- Lazy.nvim plugin manager
require('core.lazy')

require('plugins.autopairs')
require('plugins.catppuccin')
require('plugins.lsp')
require('plugins.telescope')
require('plugins.telescope-undo')
require('plugins.treesitter')

-- Custom Commands
require('custom_commands.BufOnly')

-- Color scheme
vim.cmd.colorscheme "catppuccin"

-------------------------------------------
