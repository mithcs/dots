local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Variables to be used later
-- These are the base
shell = "bash -c"
scripts_dir = " $HOME/zzz"

-- Programs
terminal = "st"
browser = "yandex-browser-stable"
thunar = "thunar"
megasync = "megasync"
editor = "nvim"
boomer = "boomer"

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

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

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
