local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

hop.setup {
  keys = 'etovxqpdygfblzhckisuran'
}

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "ss", ":HopChar2<CR>", opts)
vim.api.nvim_set_keymap("n", "sl", ":HopLineStart<CR>", opts)
