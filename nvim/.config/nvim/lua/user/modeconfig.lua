local yaml_mode_setting = function ()
  local yaml_mode_group = vim.api.nvim_create_augroup("yaml_mode", {clear=true})
  local yaml_mode = function ()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end
vim.api.nvim_create_autocmd({"FileType"}, {pattern="yaml", callback=yaml_mode, group=yaml_mode_group})
end

local lua_mode_setting = function ()
  local lua_mode_group = vim.api.nvim_create_augroup("lua_mode", {clear=true})
  local lua_mode = function ()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end
  vim.api.nvim_create_autocmd({"FileType"}, {pattern="lua", callback=lua_mode, group=lua_mode_group})
end

local c_mode_setting = function ()
  local c_mode_group = vim.api.nvim_create_augroup("c_mode", {clear=true})
  local c_mode = function ()
    vim.opt_local.cc = "80"
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab=false
  end
  vim.api.nvim_create_autocmd({"FileType"}, {pattern={"c", "cpp"}, callback=c_mode, group=c_mode_group})
end

local make_mode_setting = function ()
  local make_mode_group = vim.api.nvim_create_augroup("make_mode", {clear=true})
  local make_mode = function ()
    vim.opt_local.expandtab=false
    vim.opt_local.shiftwidth=3
    vim.opt_local.tabstop=3
  end
  vim.api.nvim_create_autocmd({"FileType"}, {pattern="make", callback=make_mode, group=make_mode_group})
end

local latex_mode_setting = function ()
  local latex_mode_group = vim.api.nvim_create_augroup("latex_mode", {clear=true})
  local latex_mode = function ()
    vim.opt_local.linebreak=true
  end
  vim.api.nvim_create_autocmd({"FileType"}, {pattern="tex", callback=latex_mode, group=latex_mode_group})
end

local markdown_mode_setting = function ()
  local markdown_mode_group = vim.api.nvim_create_augroup("markdown_mode", {clear=true})
  local markdown_mode = function ()
    vim.opt_local.linebreak=true
  end
  vim.api.nvim_create_autocmd({"FileType"}, {pattern="markdown", callback=markdown_mode, group=markdown_mode_group})
end

yaml_mode_setting()
lua_mode_setting()
c_mode_setting()
make_mode_setting()
latex_mode_setting()
markdown_mode_setting()
