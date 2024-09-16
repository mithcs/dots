require("telescope").setup({
    extensions = {
        undo = {
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
                preview_height = 0.8,
            },
            mappings = {
                i = {
                    ["<cr>"] = require("telescope-undo.actions").yank_additions,
                    ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                    ["<C-cr>"] = require("telescope-undo.actions").restore,
                    -- alternative defaults, for users whose terminals do questionable things with modified <cr>
                    ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
                    ["<C-r>"] = require("telescope-undo.actions").restore,
                },
                n = {
                    ["y"] = require("telescope-undo.actions").yank_additions,
                    ["Y"] = require("telescope-undo.actions").yank_deletions,
                    ["u"] = require("telescope-undo.actions").restore,
                },
            },
        },
    },
})

vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
