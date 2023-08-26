local wezterm = require 'wezterm'

return {
	keys = {
		{
			key = 'h',
			mods = 'ALT',
			action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
		},
		{
			key = 'v',
			mods = 'ALT',
			action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
		},
		{
			key = 'w',
			mods = 'CMD',
			action = wezterm.action.CloseCurrentPane { confirm = true },
		},

		-- Navigation between panes
		{
			key = 'LeftArrow',
	    		mods = 'CTRL|SHIFT',
	    		action = wezterm.action.ActivatePaneDirection 'Left',
	  	},
  		{
    			key = 'RightArrow',
    			mods = 'CTRL|SHIFT',
    			action = wezterm.action.ActivatePaneDirection 'Right',
  		},
  		{
    			key = 'UpArrow',
    			mods = 'CTRL|SHIFT',
    			action = wezterm.action.ActivatePaneDirection 'Up',
  		},
  		{
    			key = 'DownArrow',
    			mods = 'CTRL|SHIFT',
    			action = wezterm.action.ActivatePaneDirection 'Down',
  		},
	}
}
