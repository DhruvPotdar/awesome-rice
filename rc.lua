require("develop")

require("globals")

require("config")

require("theme.manager").initialize()

require("core")
require("services")
require("ui")
local beautiful = require("beautiful")
-- beautiful.init("some_theme.lua")
local bling = require("bling")

local awful = require("awful")
--  Application Starts
awful.spawn.with_shell("~/.config/awesome/autostart.sh")


bling.module.wallpaper.setup {
    set_function = bling.module.wallpaper.setters.random,
    wallpaper = {"/home/radtop/Pictures/Wallpapers"},
    change_timer = 631, -- prime numbers are better for timers
    position = "maximized",
    background = "#424242"
}




---@diagnostic disable: param-type-mismatch
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
---@diagnostic enable: param-type-mismatch
