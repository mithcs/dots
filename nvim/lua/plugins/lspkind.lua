local lspkind = require("lspkind")

lspkind.init({
    symbol_map = {
        Supermaven = "";
    },
})

vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", {fg ="#fCC022"})
