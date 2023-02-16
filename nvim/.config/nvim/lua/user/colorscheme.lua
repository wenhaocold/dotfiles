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

vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
-- vim.cmd[[colorscheme catppuccin]]
vim.cmd.colorscheme("catppuccin")
local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup{
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = true,
  term_colors = false,
  compile = {
    enabled = false,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
    suffix = "_compiled"
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    coc_nvim = false,
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = true,
      transparent_panel = false,
    },
    dap = {
      enabled = false,
      enable_ui = false,
    },
    which_key = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = false,
    notify = true,
    telekasten = true,
    symbols_outline = true,
    mini = false,
  }
}
