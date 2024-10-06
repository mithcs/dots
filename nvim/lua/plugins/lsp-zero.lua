local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>dws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<Space>q", function() vim.diagnostic.setloclist() end, opts)
    vim.keymap.set("n", "<Space>e", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>dca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>drr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>drn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- -----------------------
-- Custom lsp
-- -----------------------
local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

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

lspconfig.qml6_lsp.setup{}
-- -----------------------

-- rust setup (safe to delete this part, it'd still work fine)
require('lspconfig').rust_analyzer.setup({
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

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'pyright', 'clangd', 'gopls', 'rust_analyzer'},
    handlers = {
        -- Default setup for all servers, except custom ones
        lsp_zero.default_setup,

        -- Custom setup for Lua LSP
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require("lspkind")
local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
  return
end

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 2},
        {name = 'supermaven' },
    },
    -- formatting = lsp_zero.cmp_format(),
    formatting =  {
					expandable_indicator = true,
					format = lspkind.cmp_format({
						mode = "text_symbol",
						maxwidth = 50,
						ellipsis_char = "...",
                        symbol_map = { Supermaven = ""}
					}),
				},

    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Tab mapping
        -- ['<Tab>'] = function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     elseif luasnip.expand_or_jumpable() then
        --         luasnip.expand_or_jump()
        --     else
        --         fallback()
        --     end
        -- end,
        -- ['<C-pb>'] = function(fallback)
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     elseif luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end
    }),

    -- ICONS
    lsp_zero.set_sign_icons({
        error = '✘ ',
        warn = ' ',
        hint = '⚑ ',
        info = ' '
    }),

    -- Prefix
    vim.diagnostic.config({
        virtual_text = {
            prefix = '▎',-- Could be '●', '▎', 'x'
        },
        signs = true,
        severity_sort = false,
    }),

    window = {
        completion = cmp.config.window.bordered({
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        }),
        documentation = cmp.config.window.bordered({
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        }),
    },
    experimental = {
        ghost_text = true,
    }
})

