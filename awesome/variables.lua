local awful = require("awful")

-- Variables to be used later
-- These are the base
shell = "bash -c"
scripts_dir = " $HOME/zzz"

-- Programs
terminal = "st"
browser = "yandex-browser-stable"
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
    awful.layout.suit.spiral,
    awful.layout.suit.tile,
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
