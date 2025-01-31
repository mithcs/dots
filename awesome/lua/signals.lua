-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        Awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Custom
    if Beautiful.titlebar_fun then
        Beautiful.titlebar_fun(c)
        return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = MyTable.join(
        Awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            Awful.mouse.client.move(c)
        end),
        Awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            Awful.mouse.client.resize(c)
        end)
    )

    Awful.titlebar(c, { size = 16 }) : setup {
        { -- Left
            Awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = Wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = Awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = Wibox.layout.flex.horizontal
        },
        { -- Right
            Awful.titlebar.widget.floatingbutton (c),
            Awful.titlebar.widget.maximizedbutton(c),
            Awful.titlebar.widget.stickybutton   (c),
            Awful.titlebar.widget.ontopbutton    (c),
            Awful.titlebar.widget.closebutton    (c),
            layout = Wibox.layout.fixed.horizontal()
        },
        layout = Wibox.layout.align.horizontal
    }
end)

client.connect_signal("focus", function(c) c.border_color = Beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = Beautiful.border_normal end)

-- switch to parent after closing child window
local function backham()
    local s = Awful.screen.focused()
    local c = Awful.client.focus.history.get(s, 0)
    if c then
        client.focus = c
        c:raise()
    end
end

-- attach to minimized state
client.connect_signal("property::minimized", backham)
-- attach to closed state
client.connect_signal("unmanage", backham)
-- ensure there is always a selected client during tag switching or logins
tag.connect_signal("property::selected", backham)
