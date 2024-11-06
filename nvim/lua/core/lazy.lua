local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
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

        -- neo-tree
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
            }
        },

        -- Treesitter
        { "nvim-treesitter/nvim-treesitter" },

        -- Telescope
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.5',
            -- or                              , branch = '0.1.x',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },

        -- Lualine
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },

        -- Auto pairs
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            opts = {} -- this is equalent to setup({}) function
        },

        -- Alpha
        {
            'goolord/alpha-nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
        },

        -- Comment
        {
            'numToStr/Comment.nvim',
            opts = {
                -- add any options here
            },
            lazy = false,
        },

        -- Toggle Term
        {
            'akinsho/toggleterm.nvim', version = "*", config = true
        },

        -- Neo-clip
        {
            "AckslD/nvim-neoclip.lua",
            requires = {
                {'nvim-telescope/telescope.nvim'},
            },
            config = function()
                require('neoclip').setup()
            end,
        },

        -- Colorizer
        { "norcalli/nvim-colorizer.lua" },

        -- tailwindcss colorizer
        {
            "roobert/tailwindcss-colorizer-cmp.nvim",
            -- optionally, override the default options:
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
                { -- lazy style key map
                    "<leader>u",
                    "<C>Telescope undo<cr>",
                    desc = "undo history",
                },
            },
            opts = {
                -- don't use `defaults = { }` here, do this in the main telescope spec
                extensions = {
                    undo = {
                        -- telescope-undo.nvim config, see below
                    },
                    -- no other extensions here, they can have their own spec too
                },
            },
            config = function(_, opts)
                -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
                -- configs for us. We won't use data, as everything is in it's own namespace (telescope
                -- defaults, as well as each extension).
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
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
