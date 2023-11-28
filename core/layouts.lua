local capi = Capi
local awful = require("awful")
local suit = require("awful.layout.suit")
local tilted = require("layouts.tilted")
local bling = require("bling")

local layouts = {
    default = {
        spiral = suit.spiral,
        floating = suit.floating,
        max = suit.max,
        fullscreen = suit.max.fullscreen,
    },
    name = {
        spiral= "spiral",
        floating = "Floating",
        max = "Maximize",
        fullscreen = "Fullscreen",
    },
}

capi.tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts {
        layouts.default.spiral,
        layouts.default.floating,
        layouts.default.max,
        layouts.default.fullscreen,
    }
end)

return layouts
