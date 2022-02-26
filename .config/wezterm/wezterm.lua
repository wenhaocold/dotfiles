local wezterm = require 'wezterm';
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)
return {
  -- color scheme
  color_scheme = "Gruvbox Dark",

  -- font:
  font = wezterm.font("JetBrainsMono Nerd Font",  {weight="Bold", italic=false}),
  font_size = 18.0,

  -- opacity
  window_background_opacity = 0.96,
  text_background_opacity = 0.96, -- use this option can let vim transparent.

  use_fancy_tab_bar = false,
  tab_max_width = 20,
  tab_bar_style = {
    active_tab_left = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#2b2042"}},
      {Text=SOLID_LEFT_ARROW},
    }),
    active_tab_right = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#2b2042"}},
      {Text=SOLID_RIGHT_ARROW},
    }),
    inactive_tab_left = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#1b1032"}},
      {Text=SOLID_LEFT_ARROW},
    }),
    inactive_tab_right = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#1b1032"}},
      {Text=SOLID_RIGHT_ARROW},
    }),
  },

  -- key:
  keys = {
    {key="m", mods="CMD", action="DisableDefaultAssignment"},
    {key="h", mods="CMD|CTRL", action=wezterm.action{ActivateTabRelative=-1}},
    {key="l", mods="CMD|CTRL", action=wezterm.action{ActivateTabRelative=1}},

  },
    colors = {
      tab_bar = {
        -- The color of the strip that goes along the top of the window
        -- (does not apply when fancy tab bar is in use)
        background = "#0b0022",
  
        -- The active tab is the one that has focus in the window
        active_tab = {
          -- The color of the background area for the tab
          bg_color = "#2b2042",
          -- The color of the text for the tab
          fg_color = "#c0c0c0",
  
          -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
          -- label shown for this tab.
          -- The default is "Normal"
          intensity = "Normal",
  
          -- Specify whether you want "None", "Single" or "Double" underline for
          -- label shown for this tab.
          -- The default is "None"
          underline = "None",
  
          -- Specify whether you want the text to be italic (true) or not (false)
          -- for this tab.  The default is false.
          italic = false,
  
          -- Specify whether you want the text to be rendered with strikethrough (true)
          -- or not for this tab.  The default is false.
          strikethrough = false,
        },
  
        -- Inactive tabs are the tabs that do not have focus
        inactive_tab = {
          bg_color = "#1b1032",
          fg_color = "#808080",
  
          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `inactive_tab`.
        },
  
        -- You can configure some alternate styling when the mouse pointer
        -- moves over inactive tabs
        inactive_tab_hover = {
          bg_color = "#3b3052",
          fg_color = "#909090",
          italic = true,
  
          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `inactive_tab_hover`.
        },
  
        -- The new tab button that let you create new tabs
        new_tab = {
          bg_color = "#1b1032",
          fg_color = "#808080",
  
          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `new_tab`.
        },
  
        -- You can configure some alternate styling when the mouse pointer
        -- moves over the new tab button
        new_tab_hover = {
          bg_color = "#3b3052",
          fg_color = "#909090",
          italic = true,
  
          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `new_tab_hover`.
        }
      }
    }
  
}
