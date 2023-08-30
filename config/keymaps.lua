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
			key = 'h',
	    		mods = 'CTRL|SHIFT',
	    		action = wezterm.action.ActivatePaneDirection 'Left',
	  	},
  		{
    			key = 'l',
    			mods = 'CTRL|SHIFT',
    			action = wezterm.action.ActivatePaneDirection 'Right',
  		},
  		{
    			key = 'k',
    			mods = 'CTRL|SHIFT',
    			action = wezterm.action.ActivatePaneDirection 'Up',
  		},
  		{
    			key = 'j',
    			mods = 'CTRL|SHIFT',
    			action = wezterm.action.ActivatePaneDirection 'Down',
  		},
	}
}
