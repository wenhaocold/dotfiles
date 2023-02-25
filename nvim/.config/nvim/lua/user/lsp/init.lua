local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  return
end

mason.setup()
mason_lspconfig.setup {
    ensure_installed = { "lua_ls", "clangd", "bashls"},
}


local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end



local opts = {
  on_attach = on_attach,
}

-- pylsp config
local pylsp_opts = require ("user.lsp.settings.pylsp")
pylsp_opts = vim.tbl_deep_extend("force", pylsp_opts, opts)
lspconfig.pylsp.setup(pylsp_opts)

-- clangd config
local clangd_opts = require ("user.lsp.settings.clangd")
clangd_opts = vim.tbl_deep_extend("force", clangd_opts, opts)
lspconfig.clangd.setup(clangd_opts)

-- lua_ls config
local neodev_ok, neodev = pcall(require, "neodev")
if not neodev_ok then
  return
end
neodev.setup({
  -- add any options here, or leave empty to use the default settings
})
local luals_opts = require ("user.lsp.settings.lua_ls")
luals_opts = vim.tbl_deep_extend("force", luals_opts, opts)
lspconfig.lua_ls.setup(luals_opts)

-- bash-language-server
local bashls_opts = require ("user.lsp.settings.bashls")
bashls_opts = vim.tbl_deep_extend("force", bashls_opts, opts)
lspconfig.bashls.setup(bashls_opts)

require("user.lsp.ui_config").setup()
require "user.lsp.null-ls"
