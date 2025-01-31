-- Mouse bindings
root.buttons(MyTable.join(
    Awful.button({ }, 4, Awful.tag.viewprev),
    Awful.button({ }, 5, Awful.tag.viewnext)
))

-- Key bindings
globalkeys = MyTable.join(
    -- Standard program
    Awful.key({ Modkey,           }, "Return", function () Awful.spawn(Terminal) end,
              {description = "open a terminal", group = "launcher"}),
    Awful.key({ Modkey }, "p", function () Awful.spawn(_RofiLauncher) end,
              {description = "open rofi launcher", group = "launcher"}),
    Awful.key({ Modkey }, "e", function () Awful.spawn(File_Explorer) end,
              {description = "open file explorer", group = "launcher"}),
    Awful.key({ Modkey }, "q", function () Awful.spawn(Terminal .. _Btop, false) end,
              {description = "open btop", group = "launcher"}),
    Awful.key({ Modkey }, "period", function () Awful.spawn(Zoomer, false) end,
              {description = "open zoomer", group = "launcher"}),
    Awful.key({ Modkey,  SModkey  }, "Return", function () Awful.spawn(Browser) end,
              {description = "open a browser", group = "launcher"}),
    Awful.key({ Modkey }, "v", function () Awful.spawn(Browser2) end,
              {description = "open 2nd browser", group = "launcher"}),
    Awful.key({ Modkey, SModkey }, "m", function () Awful.spawn(Megasync, false) end,
              {description = "open megasync", group = "launcher"}),

    -- Utils bindings
    Awful.key({ Modkey }, "i", function () Awful.spawn(AddClipmark) end,
              {description = "add selected text to clipmark", group = "utils"}),
    Awful.key({ Modkey, SModkey }, "i", function () Awful.spawn(ShowClipmark) end,
              {description = "show clipmark", group = "utils"}),
    Awful.key({ Modkey }, "bracketright", function () Awful.spawn(Cheatsheet) end,
              {description = "open cheatsheet", group = "utils"}),
    Awful.key({ Modkey }, "semicolon", function () Awful.spawn(EmojiPicker) end,
              {description = "open emoji picker", group = "utils"}),
    Awful.key({ Modkey }, "space", function () Awful.spawn(TextsOpener) end,
              {description = "open one of the texts", group = "utils"}),
    Awful.key({ Modkey, SModkey }, "t", function () Awful.spawn(SetTime) end,
              {description = "set date and time", group = "utils"}),

    Awful.key({ Modkey }, "F4", function () Awful.spawn(_RofiPowermenu) end,
              {description = "open rofi powermenu", group = "utils"}),
    Awful.key({ Modkey, SModkey }, "F4", function () Awful.spawn(Shutdown) end,
              {description = "shutdown pc instantly", group = "utils"}),

    -- Notification bindings
    Awful.key({ Modkey, SModkey }, "minus", function () Naughty.destroy_all_notifications() end,
              {description = "destroy all notifications", group = "utils"}),

    -- ALSA volume control
    Awful.key({ Altkey }, "Up",
        function ()
            os.execute(string.format("amixer -q set %s 1%%+", Beautiful.volume.channel))
            Beautiful.volume.update()
        end,
        {description = "volume up", group = "volume"}),
    Awful.key({ Altkey }, "Down",
        function ()
            os.execute(string.format("amixer -q set %s 1%%-", Beautiful.volume.channel))
            Beautiful.volume.update()
        end,
        {description = "volume down", group = "volume"}),
    Awful.key({ Altkey }, "m",
        function ()
            os.execute(string.format("amixer -q set %s toggle", Beautiful.volume.togglechannel or Beautiful.volume.channel))
            Beautiful.volume.update()
        end,
        {description = "toggle mute", group = "volume"}),

    -- TODO: Add network manager bindindgs

    Awful.key({ }, "Print", function () Awful.spawn(ScreenshotFull) end,
              {description = "take screenshot of whole screen", group = "screenshot"}),
    Awful.key({ Modkey }, "Print", function () Awful.spawn(ScreenshotPartial) end,
              {description = "take screenshot of partial screen", group = "screenshot"}),
    Awful.key({ SModkey }, "Print", function () Awful.spawn(ScreenshotClipboard) end,
              {description = "take screenshot of whole screen and add to clipboard", group = "screenshot"}),

    -- Awesome bindings
    Awful.key({ Modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    Awful.key({ Modkey, SModkey }, "e", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    Awful.key({ Modkey }, "s",      HotkeysPopup.show_help,
              {description="show help", group="awesome"}),

    -- Tag related bindings
    Awful.key({ Modkey }, "Left",   Awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    Awful.key({ Modkey }, "Right",  Awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    Awful.key({ Modkey }, "Escape", Awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    -- Show/hide wibox
    Awful.key({ Modkey }, "b", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end,
        {description = "toggle wibox", group = "awesome"}),

    -- On-the-fly useless gaps change
    Awful.key({ Altkey, "Control" }, "=", function () Lain.util.useless_gaps_resize(1) end,
              {description = "increment useless gaps", group = "tag"}),
    Awful.key({ Altkey, "Control" }, "-", function () Lain.util.useless_gaps_resize(-1) end,
              {description = "decrement useless gaps", group = "tag"}),

    -- Dynamic tagging
    Awful.key({ Modkey, "Shift" }, "n", function () Lain.util.add_tag() end,
              {description = "add new tag", group = "tag"}),
    Awful.key({ Modkey, "Shift" }, "r", function () Lain.util.rename_tag() end,
              {description = "rename tag", group = "tag"}),
    Awful.key({ Modkey, "Shift" }, "Left", function () Lain.util.move_tag(-1) end,
              {description = "move tag to the left", group = "tag"}),
    Awful.key({ Modkey, "Shift" }, "Right", function () Lain.util.move_tag(1) end,
              {description = "move tag to the right", group = "tag"}),
    Awful.key({ Modkey, "Shift" }, "d", function () Lain.util.delete_tag() end,
              {description = "delete tag", group = "tag"}),


    -- client related bindings
    Awful.key({ Modkey,           }, "j",
        function ()
            Awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    Awful.key({ Modkey,           }, "k",
        function ()
            Awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),


    -- Layout manipulation
    Awful.key({ Modkey, SModkey   }, "j", function () Awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    Awful.key({ Modkey, SModkey   }, "k", function () Awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    Awful.key({ Modkey, "Control" }, "j", function () Awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    Awful.key({ Modkey, "Control" }, "k", function () Awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    Awful.key({ Modkey,           }, "u", Awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    Awful.key({ Modkey,           }, "Tab",
        function ()
            Awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- More layout bindings
    Awful.key({ Modkey }, "l",     function () Awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    Awful.key({ Modkey }, "h",     function () Awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    Awful.key({ Modkey, SModkey   }, "h",     function () Awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    Awful.key({ Modkey, SModkey   }, "l",     function () Awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    Awful.key({ Modkey, "Control" }, "h",     function () Awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    Awful.key({ Modkey, "Control" }, "l",     function () Awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    -- awful.key({ modkey }, "space", function () awful.layout.inc( 1)                end,
    --           {description = "select next", group = "layout"}),
    Awful.key({ Modkey, SModkey }, "space", function () Awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    Awful.key({ Modkey, SModkey }, "bracketleft",
              function ()
                  local c = Awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    Awful.key({ Modkey },            "r",     function () Awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    Awful.key({ Modkey }, "x",
              function ()
                  Awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = Awful.screen.focused().mypromptbox.widget,
                    exe_callback = Awful.util.eval,
                    history_path = Awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"})
)

clientkeys = MyTable.join(
    Awful.key({ Modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    Awful.key({ Modkey, SModkey   }, "q",      function (c) c:kill()                         end,
              {description = "close focused window", group = "client"}),
    Awful.key({ Modkey, "Control" }, "space",  Awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    Awful.key({ Modkey, "Control" }, "Return", function (c) c:swap(Awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    Awful.key({ Modkey }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    Awful.key({ Modkey }, "bracketleft",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    Awful.key({ Modkey }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "toggle maximize", group = "client"})
    -- awful.key({ modkey, "Control" }, "m",
    --     function (c)
    --         c.maximized_vertical = not c.maximized_vertical
    --         c:raise()
    --     end ,
    --     {description = "(un)maximize vertically", group = "client"}),
    -- awful.key({ modkey, smodkey   }, "m",
    --     function (c)
    --         c.maximized_horizontal = not c.maximized_horizontal
    --         c:raise()
    --     end ,
    --     {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = MyTable.join(globalkeys,
        -- View tag only.
        Awful.key({ Modkey }, "#" .. i + 9,
                  function ()
                        local screen = Awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        Awful.key({ Modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = Awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         Awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        Awful.key({ Modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        Awful.key({ Modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = MyTable.join(
    Awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    Awful.button({ Modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        Awful.mouse.client.move(c)
    end),
    Awful.button({ Modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        Awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
