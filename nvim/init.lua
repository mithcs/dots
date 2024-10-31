-- init.lua
---------------------------------------------

-- Global options
require('core.options')

-- Keymaps
require('core.keymaps')

-- Lazy.nvim plugin manager
require('core.lazy')

require('plugins.autopairs')
require('plugins.telescope')
require('plugins.catppuccin')
require('plugins.telescope-undo')
require('plugins.treesitter')
require('plugins.lualine')
require('plugins.lspkind')
require('plugins.lsp-zero')
require('plugins.alpha')
require('plugins.colorizer')
require('plugins.tailwind-colorizer')
require('plugins.toggleterm')
require('plugins.neo-tree')
-- require('plugins.supermaven')

-- Color scheme
vim.cmd.colorscheme "catppuccin"

-------------------------------------------
