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
require('plugins.telescope-undo')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.project')
require('plugins.onedark')

-- Color scheme
vim.cmd.colorscheme "onedark"

-------------------------------------------
