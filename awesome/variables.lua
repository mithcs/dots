local gears         = require("gears")
local beautiful     = require("beautiful")
local awful = require("awful")
local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility

-- Variables to be used later
-- These are the base
shell = "bash -c"
scripts_dir = " $HOME/zzz"

-- Programs
terminal = "st"
browser = "google-chrome-stable"
file_explorer = "file_explorer"
megasync = "megasync"
editor = "nvim"
zoomer = "zoomer"

-- Utils
add_clipmark = shell .. scripts_dir .. "/AddToClipmark.sh"
show_clipmark = shell .. scripts_dir .. "/CheckClipmark.sh"
cheatsheet = shell .. scripts_dir .. "/Cheatsheet.sh"
emoji_picker = shell .. scripts_dir .. "/EmojiPicker.sh"
texts_opener = shell .. scripts_dir .. "/TextsOpener.sh"
set_time = shell .. scripts_dir .. "/SetTime.sh"
shutdown = "shutdown now"

screenshot = shell .. scripts_dir .. "/screenshot.sh"

-- Args as variables
rofi_launcher = shell .. " $HOME/.config/rofi/launchers/type-1/launcher.sh"
rofi_powermenu = shell .. " $HOME/.config/rofi/powermenu/type-1/powermenu.sh"
btop = " btop"
neomutt = " neomutt"

-- Others
editor_cmd = terminal .. " -e " .. editor


-- ---------- ---------- ---------- ----------
-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.spiral,
    awful.layout.suit.floating,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

themes = {
    "blackburn",       -- 1
    "copland",         -- 2
    "dremora",         -- 3
    "holo",            -- 4
    "multicolor",      -- 5
    "powerarrow",      -- 6
    "powerarrow-dark", -- 7
    "rainbow",         -- 8
    "steamburn",       -- 9
    "vertex"           -- 10
}

-- ---------- ---------- ---------- ----------
chosen_theme = themes[2]
modkey = "Mod4"
smodkey = "Shift"
altkey = "Mod1"


-- ---------- ---------- ---------- ----------
awful.util.taglist_buttons = mytable.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then client.focus:move_to_tag(t) end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

awful.util.tasklist_buttons = mytable.join(
     awful.button({ }, 1, function(c)
         if c == client.focus then
             c.minimized = true
         else
             c:emit_signal("request::activate", "tasklist", { raise = true })
         end
     end),
     awful.button({ }, 3, function()
         awful.menu.client_list({ theme = { width = 250 } })
     end),
     awful.button({ }, 4, function() awful.client.focus.byidx(1) end),
     awful.button({ }, 5, function() awful.client.focus.byidx(-1) end)
)

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))

