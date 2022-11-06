local options = {
  relativenumber = false,                  -- set relative numbered lines
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
