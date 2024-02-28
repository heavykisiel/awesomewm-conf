local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local vicious = require("vicious")
vicious.contrib = require("vicious.contrib")
local beautiful = require("beautiful")


local themePath = os.getenv("HOME") .. "/path/to/directory/containing/theme"

local theme = require("themes.niko")

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
-- mytextclock = wibox.widget.textclock()
-- weather

local weather_icon = wibox.widget.imagebox(beautiful.widget_weather)
local weather = wibox.widget.textbox()
local weather_widget = wibox.container.background(wibox.container.margin(wibox.widget 
{weather_icon, weather, layout = wibox.layout.align.horizontal }, 0, 1), beautiful.grey)
vicious.register(weather, vicious.widgets.weather,
" ${city} ${tempc}°C ${weather} ", 1800, "EPPO")

-- clock
local clock_icon = wibox.widget.imagebox(beautiful.widget_clock)
local clock = awful.widget.textclock("<span font=\"Hack  10\" color=\"#32302f\"> %a %d %b  %H:%M </span>")
local clock_widget = wibox.container.background(wibox.container.margin(wibox.widget {clock_icon, clock, layout = wibox.layout.align.horizontal }, 0, 1), "#8c8ccd")

-- ram
local ram_icon = wibox.widget.imagebox(beautiful.widget_mem)
local ram = wibox.widget.textbox()
local ram_widget = wibox.container.background(wibox.container.margin(wibox.widget {ram_icon, ram, layout = wibox.layout.align.horizontal }, 0, 1), beautiful.pink)
vicious.register(ram, vicious.widgets.mem,
    function(widget, args)
        local used_gb = string.format("%.1f", args[2] / 1024) -- Convert used RAM to GB
        local total_gb = string.format("%.1f", args[3] / 1024) -- Convert total RAM to GB
        return "<span font='Hack 10' color='#32302f'> RAM: " .. used_gb .. "/" .. total_gb .. " GB </span>"
    end,
    13) -- Refresh every 13 seconds (adjust this value as needed)
-- cpu
local cpu_icon = wibox.widget.imagebox(beautiful.widget_cpu)
local cpu = wibox.widget.textbox()
local cpu_widget = wibox.container.background(wibox.container.margin(wibox.widget {cpu_icon, cpu, layout = wibox.layout.align.horizontal }, 0, 1), beautiful.yellow)
vicious.register(cpu, vicious.widgets.cpu , "<span font=\"Hack  10\" color=\"#32302f\"> CPU: $1 % </span>", 1)
-- temp
--local temp_icon = wibox.widget.imagebox(beautiful.widget_temp)
--local temp = wibox.widget.textbox("<span font=\"Hack  10\" color=\"#32302f\"> temp: 00</span>")
--local temp_widget = wibox.container.background(wibox.container.margin(wibox.widget {temp_icon, temp, layout = wibox.layout.align.horizontal }, 0, 1), beautiful.darkred)
-- hdd
local hdd_icon = wibox.widget.imagebox(beautiful.widget_hdd)
local hdd = wibox.widget.textbox()
local hdd_widget = wibox.container.background(wibox.container.margin(wibox.widget {hdd_icon, hdd, layout = wibox.layout.align.horizontal }, 0, 1), beautiful.darkgreen)
vicious.register(hdd, vicious.widgets.fs, "<span font=\"Hack  10\" color=\"#32302f\"> HDD: ${/ used_gb}/${/ size_gb} GB </span>", 1)
-- GPU
local gpu_icon = wibox.widget.imagebox(beautiful.widget_gpu)
local gpu = wibox.widget.textbox()
local gpu_widget = wibox.container.background(
    wibox.container.margin(wibox.widget 
    {gpu_icon, gpu, layout = wibox.layout.align.horizontal }
    , 0, 1), beautiful.green)

-- Tooltip or Popup Widget to Display Information
local tooltip = awful.tooltip {
    objects = { gpu_widget },
    text = "GPU Info: Hover over here to see details $6",
    mode = "outside",
}
vicious.register(gpu, vicious.contrib.nvinf, "<span font=\"Hack  10\" color=\"#32302f\">: $1 % $6 GHz</span>", 1)
    -- Replace this string with the desired GPU information to display on hover

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))


awful.screen.connect_for_each_screen(function(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    style   = {
        shape = gears.shape.powerline
    },
    layout   = {
        spacing = -12,
        spacing_widget = {
            color  = '#dddddd',
            shape  = gears.shape.powerline,
            widget = wibox.widget.separator,
            halign = 'center',
            --widget = wibox.container.place,
        },
        layout  = wibox.layout.fixed.horizontal
    },
    widget_template = {
        {
            {
                {
                    {
                        {
                            id     = 'index_role',
                            widget = wibox.widget.textbox,
                        },
                        margins = 4,
                        widget  = wibox.container.margin,
                    },
                    widget = wibox.container.background,
                },
                {
                    margins = 2,
                    widget  = wibox.container.margin,
                },
                {
                    id     = 'text_role',
                    widget = wibox.widget.textbox,
                },
                layout = wibox.layout.fixed.horizontal,
            },
            left  = 2,
            right = 18,
            widget = wibox.container.margin
        },
        id     = 'background_role',
        widget = wibox.container.background,
        -- Add support for hover colors and an index label
        create_callback = function(self, c3, index, objects) --luacheck: no unused args
            self:get_children_by_id('index_role')[1].markup = '<b>  </b>'
            self:connect_signal('mouse::enter', function()
                if self.bg ~= '#ff0000' then
                    self.backup     = self.bg
                    self.has_backup = true
                end
                self.bg = '#ff0000'
            end)
            self:connect_signal('mouse::leave', function()
                if self.has_backup then self.bg = self.backup end
            end)
        end,
           },
    buttons = taglist_buttons
}

       -- Create a tasklist widget
   s.mytasklist = awful.widget.tasklist {
    screen   = s,
    filter   = awful.widget.tasklist.filter.currenttags,
    buttons  = tasklist_buttons,
    layout   = {
        spacing_widget = {
            {
                forced_width  = 5,
                forced_height = 24,
                thickness     = 1,
                color         = '#777777',
                widget        = wibox.widget.separator
            },
            valign = 'center',
            halign = 'center',
            widget = wibox.container.place,
        },
        spacing = 1,
        layout  = wibox.layout.fixed.horizontal
    },
    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
    -- not a widget instance.
    widget_template = {
        {
            wibox.widget.base.make_widget(),
            forced_height = 5,
            id            = 'background_role',
            widget        = wibox.container.background,
        },
        {
            {
                id     = 'clienticon',
                widget = awful.widget.clienticon,
            },
            margins = 5,
            widget  = wibox.container.margin
        },
        nil,
        create_callback = function(self, c, index, objects) --luacheck: no unused args
            self:get_children_by_id('clienticon')[1].client = c
        end,
        layout = wibox.layout.align.vertical,
    },
}
    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
          -- mylauncher,
          --s.mytaglist,
            s.mypromptbox,
            s.mytasklist,
        }
         --,    s.mytasklist, -- Middle widget 
         ,    s.mytaglist,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mykeyboardlayout,
            wibox.widget.systray(),
            weather_widget,
            gpu_widget,
            cpu_widget,
            ram_widget,
            hdd_widget,
            clock_widget,
            s.mylayoutbox,
        },
    }
end)
