require("catppuccin").setup({
    flavour = "mocha",

    background = {
        dark = "mocha",
    },

    transparent_background = false,
    show_end_of_buffer = true,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
        mocha = {
            base = "#000000",
            -- mantle = "#000000",
            -- crust = "#000000",
            text = "#96fae0";
        },
    },
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = false,
        nvimtree = false,
        treesitter = true,
        notify = false,
        mini = false,
    },
})
