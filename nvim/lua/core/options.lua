-- General Neovim settings and configurations
---------------------------------------------------------------------------
local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-- General
opt.clipboard = 'unnamedplus'                  -- Copy/paste to system clipboard
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.swapfile = false                           -- No swap file
opt.colorcolumn = '81'                         -- Line lenght marker at 80 columns
opt.foldenable = false
-- opt.textwidth = 80                             -- Set textwidth to 80 columns
-- opt.wrap = false                               -- Wrap lines
opt.fillchars:append({ eob = " " })            -- To remove tilde(~)

vim.cmd([[autocmd FileType * setlocal formatoptions-=ro]]) -- No comment on new line if existing line is commented

-- Neovim UI
opt.number = true           -- Show line number
opt.showmatch = true        -- Highlight matching parenthesis
opt.relativenumber = true   -- Relative number
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global Status line
opt.cursorline= true        -- Cursor line
opt.scrolloff = 25          -- To keep the cursor in the center of the screen all the time
opt.signcolumn = "yes"

-- Undo options
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
opt.undofile = true

-- Tabs, Indent
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 4          -- Shift 4 spaces when tab
opt.tabstop = 4             -- 1 tab == 4 spaces
opt.smartindent = true      -- Auto indent new lines
opt.showtabline = 2

-- Disable builtin plugins
local disabled_built_ins = {
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
