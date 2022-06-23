local pdf_app = nil

if (vim.fn.has('macunix') == 1)
then
  pdf_app = "skim"
elseif (vim.fn.has('linux') == 1)
then
  pdf_app = "zathura"
end

if pdf_app == nil
then
  error("pdf_app is nil")
end

vim.g.tex_flavor='latex' -- Default tex file format
vim.g.vimtex_view_method = pdf_app -- Choose which program to use to view PDF file
vim.g.vimtex_view_skim_sync = 1 -- Value 1 allows forward search after every successful compilation
vim.g.vimtex_view_skim_activate = 1 -- Value 1 allows change focus to skim after command `:VimtexView` is given
vim.g.vimtex_compiler_latexmk = {build_dir = "latexbuild"}
