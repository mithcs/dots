---@diagnostic disable: undefined-global           -- undefined global vim
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { 'pyright', 'clangd', 'gopls', 'rust_analyzer' },
})

local on_attach = require('plugins.lsp_opts').on_attach
-- -----------------------
-- Custom lsp
-- -----------------------
if not configs.qml6_lsp then
    configs.qml6_lsp = {
        default_config = {
            cmd = {'qmlls6'},
            filetypes = {'qml'},
            root_dir = function(fname)
                return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
            end,
            settings = {},
        },
    }
end

if not configs.dartls then
    configs.dartls = {
        default_config = {
            cmd = { "dart", "language-server", "--protocol=lsp" },
            filetypes = { "dart" },
            init_options = {
                closingLabels = true,
                flutterOutline = true,
                onlyAnalyzeProjectsWithOpenFiles = true,
                outline = true,
                suggestFromUnimportedLibraries = true
            },
            root_dir = function(fname)
                return lspconfig.util.find_git_ancestor(fname) or vim.fn.getcwd()
            end,
            settings = {
                dart = {
                    completeFunctionCalls = true,
                    showTodos = true
                }
            },
        },
    }
end
require'lspconfig'.dartls.setup({
    on_attach = on_attach
})
-- -----------------------
-- Rust
-- -----------------------
lspconfig.rust_analyzer.setup({
    autostart = false,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_dir = function(fname)
        local cargo_crate_dir = lspconfig.util.root_pattern 'Cargo.toml'(fname)
        local cmd = 'cargo metadata --no-deps --format-version 1'
        if cargo_crate_dir ~= nil then
            cmd = cmd .. ' --manifest-path ' .. lspconfig.util.path.join(cargo_crate_dir, 'Cargo.toml')
        end
        local cargo_metadata = vim.fn.system(cmd)
        local cargo_workspace_dir = nil
        if vim.v.shell_error == 0 then
            cargo_workspace_dir = vim.fn.json_decode(cargo_metadata)['workspace_root']
        end
        return cargo_workspace_dir
            or cargo_crate_dir
            or lspconfig.util.root_pattern 'rust-project.json'(fname)
            or lspconfig.util.find_git_ancestor(fname)
    end,
    settings = {
        ["rust-analyzer"] = {}
    }
})

-- -----------------------
-- Completions
-- -----------------------
local cmp = require('cmp')

cmp.setup({
    completion = {
        autocomplete = false, -- Disable autocomplete by default
    },
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'buffer', keyword_length = 1},
    },

    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Better mapping
        ['<C-n>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<C-p>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end
    }),

    vim.diagnostic.config({
        virtual_text = {
            prefix = '▎',-- Could be '●', '▎', 'x'
        },
        signs = true,
        severity_sort = false,
    }),

    window = {
        -- completion = cmp.config.window.bordered({
        --     winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        -- }),
        -- documentation = cmp.config.window.bordered({
        --     winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        -- }),
    },
    experimental = {
        ghost_text = true,
    }
})

-- Toggle completions
local function toggle_autocomplete()
    local current_setting = cmp.get_config().completion.autocomplete
    if current_setting and #current_setting > 0 then
        cmp.setup({ completion = { autocomplete = false } })
        print('Autocomplete disabled')
    else
        cmp.setup({ completion = { autocomplete = { cmp.TriggerEvent.TextChanged } } })
        print('Autocomplete enabled')
    end
end

vim.api.nvim_create_user_command('NvimCmpToggle', toggle_autocomplete, {})

vim.api.nvim_set_keymap('n', '<leader>nt', ':NvimCmpToggle<CR>', { noremap = true, silent = true })
-- -----------------------
-- Setup lsp servers
-- -----------------------
require('mason-lspconfig').setup_handlers({
    function(server)
        local opts = {
            on_attach = on_attach
        }
        lspconfig[server].setup(opts)
    end,
})
