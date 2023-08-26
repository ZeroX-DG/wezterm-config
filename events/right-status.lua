local wezterm = require 'wezterm'

local M = {}

function get_battery_info()
	local battery = wezterm.battery_info()[1]
	local percentage = battery.state_of_charge * 100
	local is_charging = false

	if battery.state == 'Charging' then
		is_charging = true
	end
		
	local icon = wezterm.nerdfonts.md_battery_high

	if not is_charging and percentage < 80 then
		icon = wezterm.nerdfonts.md_battery_medium
	elseif not is_charging and percentage < 30 then
		icon = wezterm.nerdfonts.md_battery_low
	elseif is_charging and percentage >= 80 then
		icon = wezterm.nerdfonts.md_battery_charging_high
	elseif is_charging and percentage < 80 then
		icon = wezterm.nerdfonts.md_battery_charging_medium
	elseif is_charging and percentage < 30 then
		icon = wezterm.nerdfonts.md_battery_charging_low
	end

	return string.format("%s %.0f%%", icon, percentage)
end

M.setup = function()
  wezterm.on("update-right-status", function(window, pane)
    local battery_info = " " .. get_battery_info() .. " "
    local date = wezterm.strftime(" %I:%M %p ")
    local time = wezterm.strftime(" %B %-d ")

    local status = wezterm.format({
	{Foreground={Color="#5e8052"}},
      	{Background={Color="#3c3836"}},
      	{Text=""},
      	{Foreground={Color="#1d2021"}},
      	{Background={Color="#5e8052"}},
      	{Text=time},

      	{Foreground={Color="#729c64"}},
      	{Background={Color="#5e8052"}},
      	{Text=""},
      	{Foreground={Color="#1d2021"}},
      	{Background={Color="#729c64"}},
      	{Text=date},

      	{Foreground={Color="#8ec07c"}},
      	{Background={Color="#729c64"}},
      	{Text=""},
      	{Foreground={Color="#1d2021"}},
      	{Background={Color="#8ec07c"}},
      	{Text=battery_info},
    })

    window:set_right_status(status)
  end)
end

return M
