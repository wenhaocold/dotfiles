local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.adapters.python = {
  type = 'executable';
  command = os.getenv('HOME') .. '/miniconda3/envs/pytorch/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return os.getenv('HOME') .. '/miniconda3/envs/pytorch/bin/python'
    end;
    justMyCode = false;
  },
}
