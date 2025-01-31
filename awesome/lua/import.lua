-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

Gears         = require("gears")
Awful         = require("awful")
                require("awful.autofocus")
Wibox         = require("wibox")
Beautiful     = require("beautiful")
Naughty       = require("naughty")
Lain          = require("lain")
HotkeysPopup = require("awful.hotkeys_popup")
                require("awful.hotkeys_popup.keys")
MyTable       = Awful.util.table or Gears.table -- 4.{0,1} compatibility
