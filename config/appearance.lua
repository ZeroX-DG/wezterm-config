local wezterm = require 'wezterm'

return {
  color_scheme = 'Gruvbox dark, hard (base16)',

  window_decorations = 'RESIZE',
  use_fancy_tab_bar = false,

  show_tab_index_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,

  colors = {
    tab_bar = {
      background = '#3c3836',
      new_tab = {
        bg_color = '#3c3836',
	fg_color = '#808080'
      }
    }
  }
}

