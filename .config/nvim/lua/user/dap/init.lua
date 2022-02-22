require "user.dap.python"

-- telescope
local telescope_status_ok, telescope = pcall(require, "telescope")
if telescope_status_ok then
  telescope.load_extension('dap')
end

-- dap-ui
local dapui_status_ok, dapui = pcall(require, "dapui")
if dapui_status_ok then
  dapui.setup()
end
