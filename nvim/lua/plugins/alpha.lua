local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function createNewFile()
    local filename = vim.fn.input("File name: ", "", "file")
    if filename ~= "" then
        vim.cmd("edit " .. vim.fn.fnameescape(filename))
        vim.cmd("startinsert")
    end
end

dashboard.section.header.val = {
    [[                                                                       ]],
    [[  ██████   █████                   █████   █████  ███                  ]],
    [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
    [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
    [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
    [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
    [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
    [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
    [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
    [[                                                                       ]],
    [[                         | Vande Vishnu |                              ]]
}

dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files hidden=true no_ignore=true<CR>"),
    dashboard.button("e", "  New file", function() createNewFile() end),
    dashboard.button("c", "  Configuration", ":!cd ~/.config/nvim/lua <CR>:e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("u", "  Update plugins", ":Lazy sync<CR>"),
    dashboard.button("r", "  Recently opened files", "<cmd>Telescope oldfiles<CR>"),
    dashboard.button("q", "  Quit", ":qa<CR>")
}

alpha.setup(dashboard.opts)

