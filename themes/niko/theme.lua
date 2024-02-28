

require("ErrorHandler")
local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local os, math, string = os, math, string

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/niko"
theme.font                                      = "ProFont 10"
theme.taglist_font                              = "ProFont 10"
theme.tasklist_font                             = "ProFont 10"


theme.bg_normal                                 = "#32302f"
theme.fg_normal                                 = "#a89984"
theme.bg_focus                                  = "#32302f"
theme.fg_focus                                  = "#232323"
theme.bg_urgent                                 = "#C92132"
theme.fg_urgent                                 = "#282828"

theme.fg_widget                                 = "#32302f"

theme.taglist_bg_focus                          = "#4e9699"
theme.taglist_fg_focus                          = "#282828"
theme.taglist_bg_occupied                       = "#2b5355"
theme.taglist_fg_occupied                       = "#282828"
theme.taglist_bg_empty                          = "#32302f"
theme.taglist_fg_empty                          = "#ebdbb2"
theme.taglist_bg_urgent                         = "#C92132"
theme.taglist_fg_urgent                         = "#282828"

theme.tasklist_bg_normal                        = "#111111"
theme.tasklist_fg_normal                        = "#ebdbb2"
theme.tasklist_bg_focus                         = "#ffffff"
theme.tasklist_fg_focus                         = "#ebdbb2"
theme.tasklist_bg_urgent                        = "#C92132"
theme.tasklist_fg_urgent                        = "#32302f"

theme.border_width                              = 0
theme.border_normal                             = "#32302f"
theme.border_focus                              = "#3f3f3f"
theme.border_marked                             = "#CC9393"

theme.titlebar_bg_normal                        = "#3f3f3f"
theme.titlebar_fg_normal                        = "#282828"

theme.titlebar_bg_focus                         = "#2b5355"
theme.titlebar_fg_focus                         = "#282828"

-- Layout icons
theme.layout_tile                               = theme.dir .. "/icons/layouts/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/layouts/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/layouts/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/layouts/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/layouts/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/layouts/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/layouts/spiral.png"
theme.layout_centerwork                         = theme.dir .. "/icons/layouts/centerwork.png"
theme.layout_dwindle                            = theme.dir .. "/icons/layouts/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/layouts/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/layouts/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/layouts/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/layouts/floating.png"

-- -- Panel

-- colors
theme.green          = "#00b159"
theme.red            = "#d64d4d"
theme.yellow         = "#cc9c00"
theme.blue           = "#428bca"
theme.darkred        = "#c92132"
theme.darkgreen      = "#4d7358"
theme.darkyellow     = "#f18e38" 
theme.gray           = "#5e5e5e"
theme.violet         = "#8c8ccd"
theme.pink           = "#B85C8A"
theme.black          = theme.bg_normal
theme.coloff         = "<span/>"

theme.w1 = theme.dir .. "/icons/display/1.png"
theme.w2 = theme.dir .. "/icons/display/2.png"
theme.w3 = theme.dir .. "/icons/display/3.png"
theme.w4 = theme.dir .. "/icons/display/4.png"
theme.w5 = theme.dir .. "/icons/display/5.png"
theme.w6 = theme.dir .. "/icons/display/6.png"
theme.w7 = theme.dir .. "/icons/display/7.png"
theme.w8 = theme.dir .. "/icons/display/8.png"
theme.w9 = theme.dir .. "/icons/display/9.png"
theme.w10 = theme.dir .. "/icons/display/10.png"
theme.w11 = theme.dir .. "/icons/display/11.png"
theme.w12 = theme.dir .. "/icons/display/12.png"
theme.w13 = theme.dir .. "/icons/display/13.png"
theme.w14 = theme.dir .. "/icons/display/14.png"
theme.w15 = theme.dir .. "/icons/display/15.png"
theme.w16 = theme.dir .. "/icons/display/16.png"
theme.w17 = theme.dir .. "/icons/display/17.png"

w1 = wibox.widget.imagebox(theme.w1)
w2 = wibox.widget.imagebox(theme.w2)
w3 = wibox.widget.imagebox(theme.w3)
w4 = wibox.widget.imagebox(theme.w4)
w5 = wibox.widget.imagebox(theme.w5)
w6 = wibox.widget.imagebox(theme.w6)
w7 = wibox.widget.imagebox(theme.w7)
w8 = wibox.widget.imagebox(theme.w8)
w9 = wibox.widget.imagebox(theme.w9)
w10 = wibox.widget.imagebox(theme.w10)
w11 = wibox.widget.imagebox(theme.w11)
w12 = wibox.widget.imagebox(theme.w12)
w13 = wibox.widget.imagebox(theme.w13)
w14 = wibox.widget.imagebox(theme.w14)
w15 = wibox.widget.imagebox(theme.w15)
w16 = wibox.widget.imagebox(theme.w16)
w17 = wibox.widget.imagebox(theme.w17)

theme.widget_mem                                = theme.dir .. "/icons/widgets/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/widgets/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/widgets/temp.png"
theme.widget_net                                = theme.dir .. "/icons/widgets/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/widgets/ssd.png"
theme.widget_clock                              = theme.dir .. "/icons/widgets/clock.png" 
theme.widget_music                              = theme.dir .. "/icons/widgets/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/widgets/note_on.png"
theme.widget_music_pause                        = theme.dir .. "/icons/widgets/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons/widgets/stop.png"
theme.widget_gpu                                = theme.dir .. "/icons/widgets/gpu.png"
theme.widget_weather                            = theme.dir .. "/icons/widgets/weather.png"



return theme
