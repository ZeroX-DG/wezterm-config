local wezterm = require 'wezterm'

local M = {}

function get_battery_percentage(battery)
	local percentage = battery.state_of_charge * 100
	local is_charging = false

	if battery.state == 'Charging' then
		is_charging = true
	end
		
	local icon = wezterm.nerdfonts.md_battery_high

	if not is_charging and percentage < 30 then
		icon = wezterm.nerdfonts.md_battery_low
	elseif not is_charging and percentage < 80 then
		icon = wezterm.nerdfonts.md_battery_medium
	elseif is_charging and percentage >= 80 then
		icon = wezterm.nerdfonts.md_battery_charging_high
	elseif is_charging and percentage < 30 then
		icon = wezterm.nerdfonts.md_battery_charging_low
	elseif is_charging and percentage < 80 then
		icon = wezterm.nerdfonts.md_battery_charging_medium
	end

	return string.format("%s %.0f%%", icon, percentage)
end

function get_battery_bg_color(battery)
	local percentage = battery.state_of_charge * 100
	if battery.state == 'Charging' or battery.state == 'Full' then
		return '#8ec07c'
	elseif percentage < 30 then
		return '#fb4934'
	elseif percentage < 50 then
		return '#fe8019'
	elseif percentage < 70 then
		return '#fabd2f'
	else
		return '#8ec07c'
	end
end

M.setup = function()
  wezterm.on("update-right-status", function(window, pane)
    local battery = wezterm.battery_info()[1]
    local battery_info = " " .. get_battery_percentage(battery) .. " "
    local battery_bg = get_battery_bg_color(battery)
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

      	{Foreground={Color=battery_bg}},
      	{Background={Color="#729c64"}},
      	{Text=""},
      	{Foreground={Color="#1d2021"}},
      	{Background={Color=battery_bg}},
      	{Text=battery_info},
    })

    window:set_right_status(status)
  end)
end

return M
