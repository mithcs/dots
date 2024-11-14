local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
    return
end

-- Start setup
lazy.setup({
    spec = {
        -- Catppuccin
        { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

        -- Treesitter
        { "nvim-treesitter/nvim-treesitter" },

        -- Telescope
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.5',
            -- or                              , branch = '0.1.x',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },

        -- Auto pairs
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            opts = {} -- this is equalent to setup({}) function
        },

        -- Comment
        {
            'numToStr/Comment.nvim',
            opts = {
                -- This is required, probably if there is no separate config file
            },
            lazy = false,
        },

        -- Toggle Term
        {
            'akinsho/toggleterm.nvim', version = "*", config = true
        },

        -- Colorizer
        { "norcalli/nvim-colorizer.lua" },

        -- tailwindcss colorizer
        {
            "roobert/tailwindcss-colorizer-cmp.nvim",
            config = function()
                require("tailwindcss-colorizer-cmp").setup({
                    color_square_width = 2,
                })
            end
        },

        -- Telescope-undo
        {
            "debugloop/telescope-undo.nvim",
            dependencies = {
                {
                    "nvim-telescope/telescope.nvim",
                    dependencies = { "nvim-lua/plenary.nvim" },
                },
            },
            keys = {
                {
                    "<leader>u",
                    "<C>Telescope undo<cr>",
                    desc = "undo history",
                },
            },
            config = function(_, opts)
                require("telescope").setup(opts)
                require("telescope").load_extension("undo")
            end,
        },

        -- LSP
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
