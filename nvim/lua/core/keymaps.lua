-- Define keymaps of Neovim and installed plugins
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Remove mapped '.'
map('n', '.', '<Nop>')
-- Change leader to '.'
vim.g.mapleader = '.'

-- Neovim Shortcuts

-- Remove annoyance
map('n', '<C-.>', '<Nop>')
map('i', '<C-.>', '<Nop>')

-- Append easily
map('n', '<leader>a', 'A')

-- Switch to next buffer
map('n', '<Space>n', ':bn<CR>')
-- Switch to previous buffer
map('n', '<Space>p', ':bp<CR>')
-- Delete buffer
map('n', '<Space>d', ':bd<CR>')

-- Create Split
map('n', '<leader>s', ':split<CR>')
map('n', '<leader>vs',':vsplit<CR>')

-- Stay sane
-- map('i', 'jj', '<C-c>')
-- map('i', 'kj', '<C-c>')
map('i', 'jk', '<C-c>')

-- map('n', ':Wq', ':wq<CR>')
-- map('n', ':Q', ':q<CR>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

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


-- Compile a C program
map('n', '<leader>gc', ':!gcc -Wall % -o %:r.out<CR>')

-- Compile a C++ program
map('n', '<leader>gC', ':!g++ -Wall % -o %:r.out<CR>')

-- Compile a Go program
map('n', '<leader>go', ':!go build %<CR>')

-- Set parent directory as root
map('n', '<leader>R', ':cd %:h<CR>')


-- PLUGINS KEYMAPS

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Neo-clip
map('n', '<leader>y', ':Telescope neoclip<CR>')

-- Toggle Term
map('n', '<space><space>', ':ToggleTerm<CR>')
map('n', '<space>v', ':ToggleTerm direction=vertical size=75<CR>')

-- map('t', '<esc>', [[<C-\><C-n>]], opts)
map('t', 'jk', [[<C-\><C-n>]])
-- map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
-- map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
-- map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
-- map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)


-- Neo-tree
vim.api.nvim_set_keymap("n", "<C-e>", ":Neotree toggle<CR>", { noremap = true, silent = true })
