-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

require("error-handling")
require("variables")
require("wibar")
require("bindings")
require("rules")
require("signals")
require("menu")

-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")

-- Themes define colours, icons, font and wallpapers.
beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Autorun programs
local autorun = true

autorunApps = {
    "dunst -config $HOME/.config/dunst/dunstrc"
}

if autorun then
    for app = 1, #autorunApps do
        awful.spawn(autorunApps[app])
    end
end
