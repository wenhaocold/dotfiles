-- vim.cmd [[
-- try
--   " let g:tokyonight_style = "storm"
--   " colorscheme tokyonight
--   colorscheme catppuccin 
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

-- -- dracula
-- -- show the '~' characters after the end of buffers
-- vim.g.dracula_show_end_of_buffer = true
-- -- use transparent background
-- vim.g.dracula_transparent_bg = true
-- -- set custom lualine background color
-- vim.g.dracula_lualine_bg_color = "#44475a"
-- -- set italic comment
-- vim.g.dracula_italic_comment = true

-- vim.cmd[[colorscheme catppuccin]]
vim.cmd.colorscheme("tokyonight")

require("tokyonight").setup({
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

--[[ vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha ]]
--[[ local catppuccin = require("catppuccin") ]]
--[[]]
--[[ -- configure it ]]
--[[ catppuccin.setup{ ]]
--[[   dim_inactive = { ]]
--[[     enabled = false, ]]
--[[     shade = "dark", ]]
--[[     percentage = 0.15, ]]
--[[   }, ]]
--[[   transparent_background = true, ]]
--[[   term_colors = false, ]]
--[[   compile = { ]]
--[[     enabled = false, ]]
--[[     path = vim.fn.stdpath "cache" .. "/catppuccin", ]]
--[[     suffix = "_compiled" ]]
--[[   }, ]]
--[[   no_italic = false, -- Force no italic ]]
--[[   no_bold = false, -- Force no bold ]]
--[[   styles = { ]]
--[[     comments = { "italic" }, ]]
--[[     conditionals = { "italic" }, ]]
--[[     loops = { "bold" }, ]]
--[[     functions = { "italic" }, ]]
--[[     keywords = { "bold" }, ]]
--[[     strings = {}, ]]
--[[     variables = {}, ]]
--[[     numbers = {}, ]]
--[[     booleans = { "italic" }, ]]
--[[     properties = {}, ]]
--[[     types = {}, ]]
--[[     operators = {}, ]]
--[[   }, ]]
--[[   integrations = { ]]
--[[     treesitter = true, ]]
--[[     native_lsp = { ]]
--[[       enabled = true, ]]
--[[       virtual_text = { ]]
--[[         errors = { "italic" }, ]]
--[[         hints = { "italic" }, ]]
--[[         warnings = { "italic" }, ]]
--[[         information = { "italic" }, ]]
--[[       }, ]]
--[[       underlines = { ]]
--[[         errors = { "underline" }, ]]
--[[         hints = { "underline" }, ]]
--[[         warnings = { "underline" }, ]]
--[[         information = { "underline" }, ]]
--[[       }, ]]
--[[     }, ]]
--[[     coc_nvim = false, ]]
--[[     lsp_trouble = false, ]]
--[[     cmp = true, ]]
--[[     lsp_saga = false, ]]
--[[     gitgutter = false, ]]
--[[     gitsigns = true, ]]
--[[     telescope = true, ]]
--[[     nvimtree = { ]]
--[[       enabled = true, ]]
--[[       show_root = true, ]]
--[[       transparent_panel = false, ]]
--[[     }, ]]
--[[     neotree = { ]]
--[[       enabled = false, ]]
--[[       show_root = true, ]]
--[[       transparent_panel = false, ]]
--[[     }, ]]
--[[     dap = { ]]
--[[       enabled = false, ]]
--[[       enable_ui = false, ]]
--[[     }, ]]
--[[     which_key = false, ]]
--[[     indent_blankline = { ]]
--[[       enabled = true, ]]
--[[       colored_indent_levels = false, ]]
--[[     }, ]]
--[[     dashboard = true, ]]
--[[     neogit = false, ]]
--[[     vim_sneak = false, ]]
--[[     fern = false, ]]
--[[     barbar = false, ]]
--[[     bufferline = true, ]]
--[[     markdown = true, ]]
--[[     lightspeed = false, ]]
--[[     ts_rainbow = false, ]]
--[[     hop = false, ]]
--[[     notify = true, ]]
--[[     telekasten = true, ]]
--[[     symbols_outline = true, ]]
--[[     mini = false, ]]
--[[   } ]]
--[[ } ]]
