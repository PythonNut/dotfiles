local wezterm = require 'wezterm'

base03 = '#002b36'
base02 = '#073642'
base01 = '#586e75'
base1 = '#93a1a1'
base2 = '#eee8d5'

return {
   font = wezterm.font 'Dejavu Sans Mono',
   font_size = 10.0,
   color_scheme = "Solarized Dark - Patched",
   hide_tab_bar_if_only_one_tab = true,
   window_frame = {
      font = wezterm.font 'Dejavu Sans',
      font_size = 10.0,
      active_titlebar_bg = base02,
      inactive_titlebar_bg = base02,
   },
   colors = {
      cursor_bg = base1,
      cursor_fg = base02,
      tab_bar = {
         inactive_tab_edge = base01,
         active_tab = {
            bg_color = base03,
            fg_color = base2,
         },
         inactive_tab = {
            bg_color = base02,
            fg_color = base1,
         },
         inactive_tab_hover = {
            bg_color = base01,
            fg_color = base1,
         },
         new_tab = {
            bg_color = base02,
            fg_color = base1,
         },
         new_tab_hover = {
            bg_color = base01,
            fg_color = base1,
         },
      },
   },
}
