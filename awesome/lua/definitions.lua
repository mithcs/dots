Theme = "vertex"
Modkey = "Mod4"
SModkey = "Shift"
Altkey = "Mod1"

-- Variables to be used later
-- These are the base
Shell = "bash -c"
ScriptsDir = " $HOME/zzz/"

-- Programs
Terminal = "st"
Browser = "thorium-browser"
Browser2 = "zen-browser"
File_Explorer = "thunar"
Megasync = "Megasync"
Editor = "nvim"
Zoomer = "boomer"

-- Utils
AddClipmark = Shell .. ScriptsDir .. "AddToClipmark.sh"
ShowClipmark = Shell .. ScriptsDir .. "CheckClipmark.sh"
Cheatsheet = Shell .. ScriptsDir .. "Cheatsheet.sh"
EmojiPicker = Shell .. ScriptsDir .. "EmojiPicker.sh"
TextsOpener = Shell .. ScriptsDir .. "TextsOpener.sh"
SetTime = Shell .. ScriptsDir .. "SetTime.sh"
Shutdown = "shutdown now"

ScreenshotFull = Shell .. ScriptsDir .. "FullScreenshot.sh"
ScreenshotPartial = Shell .. ScriptsDir .. "PartialScreenshot.sh"
ScreenshotClipboard = Shell .. ScriptsDir .. "ScreenshotToClipboard.sh"

-- Args as variables
_RofiLauncher = Shell .. " $HOME/.config/rofi/launchers/type-1/launcher.sh"
_RofiPowermenu = Shell .. " $HOME/.config/rofi/powermenu/type-1/powermenu.sh"
_Btop = " btop"

-- Others
EditorCmd = Terminal .. " -e " .. Editor


Awful.util.Terminal = Terminal
Awful.util.tagnames = { "1", "2", "3", "4", "5" }
Awful.layout.layouts = {
    Awful.layout.suit.tile,
    Awful.layout.suit.floating,
    Awful.layout.suit.corner.nw,
    Awful.layout.suit.spiral,
    Awful.layout.suit.tile.left,
    Awful.layout.suit.tile.bottom,
    Awful.layout.suit.tile.top,
    Awful.layout.suit.fair,
    Awful.layout.suit.fair.horizontal,
    Awful.layout.suit.spiral.dwindle,
    Awful.layout.suit.max,
    Awful.layout.suit.max.fullscreen,
    Awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

Lain.layout.termfair.nmaster           = 3
Lain.layout.termfair.ncol              = 1
Lain.layout.termfair.center.nmaster    = 3
Lain.layout.termfair.center.ncol       = 1
Lain.layout.cascade.tile.offset_x      = 2
Lain.layout.cascade.tile.offset_y      = 32
Lain.layout.cascade.tile.extra_padding = 5
Lain.layout.cascade.tile.nmaster       = 5
Lain.layout.cascade.tile.ncol          = 2

Awful.util.taglist_buttons = MyTable.join(
    Awful.button({ }, 1, function(t) t:view_only() end),
    Awful.button({ Modkey }, 1, function(t)
        if client.focus then client.focus:move_to_tag(t) end
    end),
    Awful.button({ }, 3, Awful.tag.viewtoggle),
    Awful.button({ Modkey }, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
    end),
    Awful.button({ }, 4, function(t) Awful.tag.viewnext(t.screen) end),
    Awful.button({ }, 5, function(t) Awful.tag.viewprev(t.screen) end)
)

Awful.util.tasklist_buttons = MyTable.join(
     Awful.button({ }, 1, function(c)
         if c == client.focus then
             c.minimized = true
         else
             c:emit_signal("request::activate", "tasklist", { raise = true })
         end
     end),
     Awful.button({ }, 3, function()
         Awful.menu.client_list({ theme = { width = 250 } })
     end),
     Awful.button({ }, 4, function() Awful.client.focus.byidx(1) end),
     Awful.button({ }, 5, function() Awful.client.focus.byidx(-1) end)
)

Beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), Theme))
