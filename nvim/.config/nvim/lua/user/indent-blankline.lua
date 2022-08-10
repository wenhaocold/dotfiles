local indentline_status_ok, indentline = pcall(require, "indent_blankline")
if not indentline_status_ok then
  return
end

vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("tab:<->")
vim.opt.list = true

indentline.setup {
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
  char_list = {'|', '¦', '┆', '┊'},
  show_first_indent_level = false,
  -- char_list_blankline = {'|', '¦', '┆', '┊'}
  --
  -- context_char = '.' --'' --'' --'' --'' --'' -- ''
  -- context_char_blankline = '',

  -- context_char_list = {'1', '2', '3', '4'}
}

-- vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", {fg="#EFEAD8"})
