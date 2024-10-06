require("neo-tree").setup({
    sources = {
        "filesystem",
        "buffers",
    },
    add_blank_line_at_top = false, -- Add a blank line at the top of the tree.
    auto_clean_after_session_restore = false, -- Automatically clean up broken neo-tree buffers saved in sessions
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    default_source = "filesystem",
    enable_diagnostics = true,
    enable_git_status = true,
    enable_modified_markers = true, -- Show markers for files with unsaved changes.
    enable_opened_markers = true,   -- Enable tracking of opened files. Required for `components.name.highlight_opened_files`
    enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
    git_status_async_options = {
        batch_size = 1000, -- how many lines of git status results to process at a time
        batch_delay = 10,  -- delay in ms between batches. Spreads out the workload to let other processes run.
        max_lines = 10000, -- How many lines of git status results to process. Anything after this will be dropped.
    },
    hide_root_node = false, -- Hide the root node.
    retain_hidden_root_indent = false, -- IF the root node is hidden, keep the indentation anyhow. 
    log_level = "info", -- "trace", "debug", "info", "warn", "error", "fatal"
    log_to_file = false, -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
    open_files_in_last_window = true, -- false = open files in top left window
    open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" }, -- when opening files, do not use windows containing these filetypes or buftypes
    popup_border_style = "NC", -- "double", "none", "rounded", "shadow", "single" or "solid"
    resize_timer_interval = 500, -- in ms, needed for containers to redraw right aligned and faded content
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    sort_function = nil , -- uses a custom function for sorting files and directories in the tree
    use_popups_for_input = true, -- If false, inputs will use vim.ui.input() instead of custom floats.
    use_default_mappings = true,
    -- source_selector provides clickable tabs to switch between sources.
    source_selector = {
        winbar = false, -- toggle to show selector on winbar
        statusline = false, -- toggle to show selector on statusline
        show_scrolled_off_parent_node = false, -- this will replace the tabs with the parent path
        -- of the top visible node when scrolled down.
        sources = {
            { source = "filesystem" },
            { source = "buffers" },
            { source = "git_status" },
        },
        content_layout = "start", -- only with `tabs_layout` = "equal", "focus"
        tabs_layout = "equal", -- start, end, center, equal, focus
        truncation_character = "…", -- character to use when truncating the tab label
        tabs_min_width = nil, -- nil | int: if int padding is added based on `content_layout`
        tabs_max_width = nil, -- this will truncate text even if `text_trunc_to_fit = false`
        padding = 0, -- can be int or table
        separator = { left = "▏", right= "▕" },
        separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
        show_separator_on_edge = false,

        highlight_tab = "NeoTreeTabInactive",
        highlight_tab_active = "NeoTreeTabActive",
        highlight_background = "NeoTreeTabInactive",
        highlight_separator = "NeoTreeTabSeparatorInactive",
        highlight_separator_active = "NeoTreeTabSeparatorActive",

    },

    default_component_configs = {
        container = {
            enable_character_fade = true,
            width = "100%",
            right_padding = 0,
        },
        indent = {
            indent_size = 2,
            padding = 1,
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "󰜌",
            folder_empty_open = "󰜌",
            default = "*",
            highlight = "NeoTreeFileIcon"
        },
        modified = {
            symbol = "[+] ",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            highlight_opened_files = false, -- Requires `enable_opened_markers = true`. 
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
        git_status = {
            symbols = {
                added     = "✚", -- NOTE: you can set any of these to an empty string to not show them
                deleted   = "✖",
                modified  = "",
                renamed   = "󰁕",
                untracked = "",
                ignored   = "",
                unstaged  = "󰄱",
                staged    = "",
                conflict  = "",
            },
            align = "right",
        },
    },
    renderers = {
        directory = {
            { "indent" },
            { "icon" },
            { "current_filter" },
            {
                "container",
                content = {
                    { "name", zindex = 10 },
                    { "clipboard", zindex = 10 },
                    { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
                    { "git_status", zindex = 20, align = "right", hide_when_expanded = true },
                },
            },
        },
        file = {
            { "indent" },
            { "icon" },
            {
                "container",
                content = {
                    {
                        "name",
                        zindex = 10
                    },
                    { "clipboard", zindex = 10 },
                    { "bufnr", zindex = 10 },
                    { "modified", zindex = 20, align = "right" },
                    { "diagnostics",  zindex = 20, align = "right" },
                    { "git_status", zindex = 20, align = "right" },
                },
            },
        },
        message = {
            { "indent", with_markers = false },
            { "name", highlight = "NeoTreeMessage" },
        },
        terminal = {
            { "indent" },
            { "icon" },
            { "name" },
            { "bufnr" }
        }
    },
    window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
        position = "left", -- left, right, top, bottom, float, current
        width = 30, -- applies to left and right positions
        height = 15, -- applies to top and bottom positions
        auto_expand_width = false, -- expand the window when file exceeds the window width. does not work with position = "float"

        popup = { -- settings that apply to float position only
            size = {
                height = "80%",
                width = "50%",
            },
            position = "50%",
        },

        same_level = false,
        insert_as = "child",
        mapping_options = {
            noremap = true,
            nowait = true,
        },

        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false,
            },

            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "cancel",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["R"] = "refresh",
            ["a"] = {
                "add",
                config = {
                    show_path = "none",
                }
            },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy",
            ["m"] = "move",
            ["e"] = "toggle_auto_expand_width",
            ["q"] = "close_window",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
        },
    },
    filesystem = {
        window = {
            mappings = {
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                ["D"] = "fuzzy_finder_directory",
                ["#"] = "fuzzy_sorter",
                ["f"] = "filter_on_submit",
                ["<C-x>"] = "clear_filter",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["[g"] = "prev_git_modified",
                ["]g"] = "next_git_modified",
            },
            fuzzy_finder_mappings = {
                ["<down>"] = "move_cursor_down",
                ["<C-n>"] = "move_cursor_down",
                ["<up>"] = "move_cursor_up",
                ["<C-p>"] = "move_cursor_up",
            },
        },
        async_directory_scan = "auto",
        scan_mode = "shallow",
        bind_to_cwd = true,
        cwd_target = {
            sidebar = "tab",
            current = "window"
        },
        filtered_items = {
            visible = false,
            force_visible_in_empty_folder = false,
            show_hidden_count = true,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true,
            hide_by_name = {
                ".DS_Store",
                "thumbs.db"
            },
            hide_by_pattern = { -- uses glob style patterns
                --"*.meta",
                --"*/src/*/tsconfig.json"
            },
        },
        find_by_full_path_words = false,
        group_empty_dirs = false,
        search_limit = 50,
        follow_current_file = {
            enabled = false,
            leave_dirs_open = false,
        },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = false,
    },
    buffers = {
        bind_to_cwd = true,
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },
        group_empty_dirs = true,
        show_unloaded = false,
        window = {
            mappings = {
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["bd"] = "buffer_delete",
            },
        },
    },
    git_status = {
        window = {
            mappings = {
                ["A"] = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
            },
        },
    },
    document_symbols = {
        follow_cursor = false,
        client_filters = "first",
        renderers = {
            root = {
                {"indent"},
                {"icon", default="C" },
                {"name", zindex = 10},
            },
            symbol = {
                {"indent", with_expanders = true},
                {"kind_icon", default="?" },
                {"container",
                content = {
                    {"name", zindex = 10},
                    {"kind_name", zindex = 20, align = "right"},
                }
            }
        },
    },
    window = {
        mappings = {
            ["<cr>"] = "jump_to_symbol",
            ["o"] = "jump_to_symbol",
            ["A"] = "noop",
            ["d"] = "noop",
            ["y"] = "noop",
            ["x"] = "noop",
            ["p"] = "noop",
            ["c"] = "noop",
            ["m"] = "noop",
            ["a"] = "noop",
            ["/"] = "filter",
            ["f"] = "filter_on_submit",
        },
    },
    kinds = {
        Unknown = { icon = "?", hl = "" },
        Root = { icon = "", hl = "NeoTreeRootName" },
        File = { icon = "󰈙", hl = "Tag" },
        Module = { icon = "", hl = "Exception" },
        Namespace = { icon = "󰌗", hl = "Include" },
        Package = { icon = "󰏖", hl = "Label" },
        Class = { icon = "󰌗", hl = "Include" },
        Method = { icon = "", hl = "Function" },
        Property = { icon = "󰆧", hl = "@property" },
        Field = { icon = "", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "󰒻", hl = "@number" },
        Interface = { icon = "", hl = "Type" },
        Function = { icon = "󰊕", hl = "Function" },
        Variable = { icon = "", hl = "@variable" },
        Constant = { icon = "", hl = "Constant" },
        String = { icon = "󰀬", hl = "String" },
        Number = { icon = "󰎠", hl = "Number" },
        Boolean = { icon = "", hl = "Boolean" },
        Array = { icon = "󰅪", hl = "Type" },
        Object = { icon = "󰅩", hl = "Type" },
        Key = { icon = "󰌋", hl = "" },
        Null = { icon = "", hl = "Constant" },
        EnumMember = { icon = "", hl = "Number" },
        Struct = { icon = "󰌗", hl = "Type" },
        Event = { icon = "", hl = "Constant" },
        Operator = { icon = "󰆕", hl = "Operator" },
        TypeParameter = { icon = "󰊄", hl = "Type" },
    }
},
        })


vim.api.nvim_set_keymap('n', '<C-e>', ':Neotree toggle<CR>', { noremap = true, silent = true })
