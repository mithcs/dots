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

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")


-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()
