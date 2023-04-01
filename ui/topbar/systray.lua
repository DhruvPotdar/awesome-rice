local capi = Capi
local beautiful = require("theme.manager")._beautiful
local wibox = require("wibox")
local dpi = Dpi
local capsule = require("widget.capsule")
local gtable = require("gears.table")
local hui = require("utils.ui")


local systray = { mt = {} }

function systray:refresh()
    local app_count = capi.awesome.systray()
    self:set_visible(app_count > 0)
end

function systray.new(wibar)
    local self = wibox.widget {
        widget = capsule,
        enable_overlay = false,
        margins = hui.thickness {
            top = beautiful.wibar.paddings.top,
            right = beautiful.capsule.default_style.default.margins.right,
            bottom = beautiful.wibar.paddings.bottom,
            left = beautiful.capsule.default_style.default.margins.left,
        },
        paddings = hui.thickness { dpi(4), dpi(10) },
        wibox.widget.systray(),
    }

    gtable.crush(self, systray, true)

    self._private.wibar = wibar

    capi.awesome.connect_signal("systray::update", function() self:refresh() end)

    self:refresh()

    return self
end

function systray.mt:__call(...)
    return systray.new(...)
end

return setmetatable(systray, systray.mt)
