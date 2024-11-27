---@diagnostic disable: undefined-global           -- undefined global vim
-- Define keymaps of Neovim and installed plugins
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- --------------------- --------------------- ---------------------

-- Remove mapped '.'
map('n', '.', '<Nop>')
-- Change leader to '.'
vim.g.mapleader = '.'

-- --------------------- --------------------- ---------------------

-- Neovim Shortcuts

-- Remove annoyance
map('n', '<C-.>', '<Nop>')
map('i', '<C-.>', '<Nop>')

-- Buffer mappings
map('n', '<Space>n', ':bn<CR>')
map('n', '<Space>p', ':bp<CR>')
map('n', '<Space>c', ':BufOnly<CR>')

-- Close easily
map('n', '<Space>d', ':close<CR>')

-- Create Split
map('n', '<leader>s', ':split<CR>')
map('n', '<leader>vs',':vsplit<CR>')

-- Stay sane
map('i', 'jk', '<ESC>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
-- Windows resizing
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and w
map('n', '<leader>w', ':w<CR>')

-- Spell check
map('n', '<F12>', ':setlocal spell! spelllang=en<CR>')

-- Move line up or down
map('n', '<A-j>', ':m+<CR>')
map('n', '<A-k>', ':m--<CR>')

-- Set parent directory as root
map('n', '<leader>R', ':cd %:h<CR>')

-- Go to config file
map('n', '<leader><leader><leader>', ':e $MYVIMRC<CR>')

-- Terminal mappings
map('n', '<leader>t', ':terminal<CR>')
map('t', 'jk', '<C-\\><C-n>')

-- -- to move around splits
map('t', '<C-h>', '<C-\\><C-n><C-w>h')
map('t', '<C-j>', '<C-\\><C-n><C-w>j')
-- map('t', '<C-k>', '<C-\\><C-n><C-w>k')
-- map('t', '<C-l>', '<C-\\><C-n><C-w>l')

-- Indent entire file
map('n', '<leader>=', 'gg=G\'\'')

