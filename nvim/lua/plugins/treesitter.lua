-- Treesitter config file

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

nvim_treesitter.setup {
    ensure_installed = {
        'c', 'cpp', 'css', 'html', 'typescript', 'lua', 'python', 'go', 'astro'
    },
    sync_install = false,
    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
}
