-- Rules to apply to new clients (through the "manage" signal).
Awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = { },
        properties = {
            border_width = Beautiful.border_width,
            border_color = Beautiful.border_normal,
            callback = Awful.client.setslave,
            focus = Awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = Awful.screen.preferred,
            placement = Awful.placement.no_overlap+Awful.placement.no_offscreen,
            size_hints_honor = false
        }
    },

    -- Floating clients.
    -- { rule_any = {
    --     instance = {
    --     },
    --     class = {
    --       "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
    --       },
    --
    --     -- Note that the name property shown in xprop might be set slightly after creation of the client
    --     -- and the name shown there might not match defined rules here.
    --     name = {
    --       "Event Tester",  -- xev.
    --     },
    --     role = {
    --       "AlarmWindow",  -- Thunderbird's calendar.
    --       "ConfigManager",  -- Thunderbird's about:config.
    --       "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
    --     }
    --   }, properties = { floating = true }},
    --
    -- -- Add titlebars to normal clients and dialogs
    -- { rule_any = {type = { "normal", "dialog" }
    --   }, properties = { titlebars_enabled = false }
    -- },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
