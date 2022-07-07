local indentline_status_ok, indentline = pcall(require, "indent_blankline")
if not indentline_status_ok then
  return
end

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

indentline.setup {
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
}
