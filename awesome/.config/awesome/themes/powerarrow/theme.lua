--[[

Powerarrow Awesome WM theme
github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local math, string, os = math, string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow"
theme.wallpaper                                 = theme.dir .. "/wall.png"
theme.font                                      = "MesloLGS NF 10"
theme.fg_normal                                 = "#eeeeee"
theme.fg_focus                                  = "#73cef4"
theme.fg_urgent                                 = "#f43753"
theme.bg_normal                                 = "#1d1d1d"
theme.bg_focus                                  = "#282828"
theme.bg_urgent                                 = "#1d1d1d"
theme.bg_systray                                = "none"
theme.tasklist_bg_focus                         = "#282828"
theme.tasklist_fg_focus                         = "#73cef4"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#1d1d1d"
theme.border_focus                              = "#f43753"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_focus                         = "#282828"
theme.titlebar_bg_normal                        = "#1d1d1d"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_brightness                         = theme.dir .. "/icons/brightness.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_music_pause                        = theme.dir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons/stop.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.widget_task                               = theme.dir .. "/icons/task.png"
theme.widget_scissors                           = theme.dir .. "/icons/scissors.png"
theme.tasklist_plain_task_name                  = false
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 8
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

-- Text Clock
local mytextclock = wibox.widget.textclock("%H:%M", 60)
mytextclock.font = theme.font

-- Taskwarrior
local task = wibox.widget.imagebox(theme.widget_task)
lain.widget.contrib.task.attach(task, {
  -- do not colorize output
  -- show_cmd = "task | sed -r 's/\\x1B\\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g'",
  show_cmd = 'task rc.verbose:nothing'
})
task:buttons(my_table.join(awful.button({}, 1, lain.widget.contrib.task.prompt)))

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
  settings = function()
    widget:set_markup(markup.fontfg(theme.font, theme.bg_focus, mem_now.used .. "Mb"))
  end
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
  settings = function()
    local cpup = string.format("%2.0f", cpu_now.usage)
    widget:set_markup(markup.fontfg(theme.font, theme.bg_focus, cpup .. "%"))
  end
})

-- Coretemp (lain, average)
local temp = lain.widget.temp({
  settings = function()
    widget:set_markup(markup.fontfg(theme.fontfg, theme.bg_focus, coretemp_now .. "°C"))
  end
})
--]]
local tempicon = wibox.widget.imagebox(theme.widget_temp)

-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_hdd)
theme.fs = lain.widget.fs({
  settings = function()
    local fsp = string.format("%3.0f%s", fs_now["/home"].free, fs_now["/home"].units)
    widget:set_markup(markup.fontfg(theme.font, theme.bg_focus, fsp))
  end
})
--]]

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
  settings = function()
    local netp = string.format("%4.0fMb ↓↑ %4.0fMb", net_now.received, net_now.sent)
    widget:set_markup(markup.fontfg(theme.font, theme.bg_focus, netp))
  end
})

-- Brigtness
local brighticon = wibox.widget.imagebox(theme.widget_brightness)
-- If you use xbacklight, comment the line with "light -G" and uncomment the line bellow
-- local brightwidget = awful.widget.watch('xbacklight -get', 0.1,
local brightwidget = awful.widget.watch('light -G', 0.1,
function(widget, stdout, stderr, exitreason, exitcode)
  local brightness_level = tonumber(string.format("%.0f", stdout))
  widget:set_markup(markup.font(theme.font, brightness_level .. "%"))
end)

-- Separators
local arrow = separators.arrow_left
local arrow_r = separators.arrow_right

function theme.powerline_rl(cr, width, height)
  local arrow_depth, offset = height/2, 0

  -- Avoid going out of the (potential) clip area
  if arrow_depth < 0 then
    width  =  width + 2*arrow_depth
    offset = -arrow_depth
  end

  cr:move_to(offset + arrow_depth         , 0        )
  cr:line_to(offset + width               , 0        )
  cr:line_to(offset + width - arrow_depth , height/2 )
  cr:line_to(offset + width               , height   )
  cr:line_to(offset + arrow_depth         , height   )
  cr:line_to(offset                       , height/2 )

  cr:close_path()
end

local function pl(widget, bgcolor, padding)
  return wibox.container.background(wibox.container.margin(widget, dpi(16), dpi(16)), bgcolor, theme.powerline_rl)
end

function theme.at_screen_connect(s)
  -- Quake application
  s.quake = lain.util.quake({ app = awful.util.terminal })

  -- If wallpaper is a function, call it with the screen
  local wallpaper = theme.wallpaper
  if type(wallpaper) == "function" then
    wallpaper = wallpaper(s)
  end
  gears.wallpaper.maximized(wallpaper, s, true)

  -- Tags
  awful.tag(awful.util.tagnames, s, awful.layout.layouts)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(my_table.join(
  awful.button({}, 1, function () awful.layout.inc( 1) end),
  awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
  awful.button({}, 3, function () awful.layout.inc(-1) end),
  awful.button({}, 4, function () awful.layout.inc( 1) end),
  awful.button({}, 5, function () awful.layout.inc(-1) end)))


  local tag_colors = {
    "#aaaaaa",
    "#d3b987",
    "#73cef4",
    "#b3deef",
    "#ffc24b",
    "#c9d05c",
    "#f43753",
  }
  local tag_names = {
    "Web ",
    "Vim ",
    "Term ",
    "Chat ",
    "Music ",
    "Steam ",
    "Autre "
  }

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist{
    screen = s,
    filter = awful.widget.taglist.filter.all,
    fg = "#282828",
    style = {
      shape = gears.shape.powerline,
    },
    layout   = {
      spacing = -12,
      layout  = wibox.layout.fixed.horizontal
    },
    buttons = taglist_buttons,
    widget_template = {
      shape = gears.shape.powerline,
      widget = wibox.container.background,
      {
        left  = 15,
        right = 10,
        widget = wibox.container.margin,
        {
          layout = wibox.layout.fixed.horizontal,
          {
            id     = 'icon_role',
            widget = wibox.widget.imagebox,
          },
          {
            id     = 'index_role',
            widget = wibox.widget.textbox,
          },
          {
            id     = 'tag_label',
            widget = wibox.widget.textbox,
          },
        },
      },
      -- Add support for colors and an index label
      create_callback = function(self, c3, index, objects) --luacheck: no unused args
        self:get_children_by_id('index_role')[1].markup = index .. ":"
        self:get_children_by_id('tag_label')[1].markup = tag_names[index]
        self.bg = tag_colors[index]
        self.shape_border_color = "#f43753"

        if c3.selected then
          self.opacity = 1
        else
          self.opacity = 0.5
        end
      end,
      update_callback = function(self, c3, index, objects) --luacheck: no unused args
        if c3.selected then
          self.opacity = 1
          -- Hack to force redraw, doesnt affect the widget
          self.shape_clip = false
        else
          self.opacity = 0.5
          -- Hack to force redraw, doesnt affect the widget
          self.shape_clip = true
        end
      end,
    },
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist{
    screen = s , 
    filter = awful.widget.tasklist.filter.currenttags, 
    buttons = awful.util.tasklist_buttons,
  }

  -- Create the wibox

  local my_wibar = wibox.widget {
    wibox.widget { -- Left widgets
    layout = wibox.layout.align.horizontal,
    wibox.container.margin(arrow_r("alpha","alpha"),0,-15),
    s.mytaglist,
    s.mypromptbox,
  },
  s.mytasklist, -- Middle widgets 
  wibox.widget { -- Right widgets
  layout = wibox.layout.fixed.horizontal,
  wibox.widget.systray(),
  arrow("alpha", "#f43753"),
  wibox.container.background(wibox.container.margin(wibox.widget { net.widget, layout = wibox.layout.fixed.horizontal }, dpi(2), dpi(6)),"#f43753"),
  arrow("#f43753", "#c9d05c"),
  wibox.container.background(wibox.container.margin(wibox.widget { cpuicon, cpu.widget, layout = wibox.layout.fixed.horizontal }, dpi(2), dpi(6)),"#c9d05c"),
  arrow("#c9d05c", "#ffc24b"),
  wibox.container.background(wibox.container.margin(wibox.widget { tempicon, temp.widget, layout = wibox.layout.fixed.horizontal }, dpi(2), dpi(6)),"#ffc24b"),
  arrow("#ffc24b", "#b3deef"),
  wibox.container.background(wibox.container.margin(wibox.widget { memicon, mem.widget, layout = wibox.layout.fixed.horizontal }, dpi(2), dpi(6)),"#b3deef"),
  arrow("#b3deef", "#73cef4"),
  wibox.container.background(wibox.container.margin(wibox.widget { fsicon, theme.fs and theme.fs.widget, layout = wibox.layout.fixed.horizontal }, dpi(2), dpi(6)),"#73cef4"),
  arrow("#73cef4", "#aaaaaa"),
  wibox.container.background(wibox.container.margin(wibox.widget { mytextclock, layout = wibox.layout.fixed.horizontal }, dpi(2), dpi(6)), "#aaaaaa"),
  --]]
  wibox.container.background(s.mylayoutbox, "#aaaaaa"),
},
layout = wibox.layout.align.horizontal,
expand = "none"
}

  s.mywibox = awful.wibar({ widget = my_wibar, position = "bottom", screen = s, height = dpi(24), bg = "none", fg = "#282828" })
end

return theme
