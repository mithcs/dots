local M = {}

local function lsp_keymaps(bufnr)
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
end

-- add more options for lsp here

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)

    -- set custom shortcuts here
    if client.name == "gopls" then
        vim.keymap.set("n", "<leader>err", 'iif err != nil {\n    panic!(err)\n}<Esc>', {buffer = bufnr, remap = false})
    end
end

return M
