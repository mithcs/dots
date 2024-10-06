require("toggleterm").setup{
    size = 20,

    float_opts = {
        border = 'curved'
    },

    direction = 'float',
    persist_mode = true,
    close_on_exit = true,

    -- auto_scroll = true
}


vim.api.nvim_set_keymap('n', '<space><space>', ':ToggleTerm<CR>', {})
vim.api.nvim_set_keymap('n', '<space>v', ':ToggleTerm direction=vertical size=75<CR>', {})
vim.api.nvim_set_keymap('t', 'jk', [[<C-\><C-n>]], {})
