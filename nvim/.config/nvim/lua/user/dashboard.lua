vim.g.dashboard_default_executive = 'telescope'
-- 变量赋值的三种写法
-- 1. vimscript
-- vim.cmd [[
-- let g:dashboard_custom_shortcut={
--       \ 'last_session'       : '<Leader> fs l',
--       \ 'find_history'       : '<Leader> f h',
--       \ 'find_file'          : '<Leader> f f',
--       \ 'new_file'           : '<Leader> f n',
--       \ 'change_colorscheme' : '<Leader> f c',
--       \ 'find_word'          : '<Leader> f w',
--       \ 'book_marks'         : '<Leader> f m',
--       \ }
-- ]]
-- 2. vim.api.nvim_set_var
-- vim.api.nvim_set_var('dashboard_custom_shortcut', {
--   last_session       = '<Leader> fs l',
--   find_history       = '<Leader> f h',
--   find_file          = '<Leader> f f',
--   new_file           = '<Leader> f n',
--   change_colorscheme = '<Leader> f c',
--   find_word          = '<Leader> f w',
--   book_marks         = '<Leader> f m',
-- })
-- 3. vim.g
vim.g.dashboard_custom_shortcut = {
  last_session       = '<Leader> fs l',
  find_history       = '<Leader> f h',
  find_file          = '<Leader> f f',
  new_file           = '<Leader> f n',
  change_colorscheme = '<Leader> f c',
  find_word          = '<Leader> f w',
  book_marks         = '<Leader> f m',
}
-- keymap
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- keymap("n", "<leader>w", ":w<cr>", opts)
-- keymap("n", "<leader>ff", ":DashboardFindFile<CR>", opts)
-- keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
-- keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
-- keymap("n", "<leader>ft", ":Telescope help_tags<cr>", opts)
-- keymap("n", "<leader>fh", ":DashboardFindHistory<CR>", opts)
-- keymap("n", "<leader>fc", ":DashboardChangeColorscheme<CR>", opts)
-- keymap("n", "<leader>fw", ":DashboardFindWord<CR>", opts)
-- keymap("n", "<leader>fm", ":DashboardJumpMark<CR>", opts)
-- keymap("n", "<leader>fn", ":DashboardNewFile<CR>nmap <leader>fss :<C-u>SessionSave<CR>", opts)
-- keymap("n", "<leader>fe", ":normal ,q,e<cr>", opts)


