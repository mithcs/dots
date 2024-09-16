-- Treesitter config file

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

nvim_treesitter.setup {
    -- A list of parsers name, or "all"
    ensure_installed = {
        'c', 'cpp', 'css', 'html', 'javascript', 'lua', 'python', 'go'
    },
    -- Install parsers synchronously (only applied to 'ensure_installed')
    sync_install = false,
    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
}
