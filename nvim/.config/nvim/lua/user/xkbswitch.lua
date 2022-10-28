function Toogle_xkbsw()
  if vim.fn.has('macunix') == 1 and vim.fn.findfile('/usr/local/lib/libxkbswitch.dylib')
  then
    if vim.g.XkbSwitchEnabled == 1
    then
      vim.g.XkbSwitchEnabled = 0
    elseif vim.g.XkbSwitchEnabled == 0
    then
      vim.g.XkbSwitchEnabled = 1
    end
  end
end

function Close_xkbsw()
  if vim.fn.has('macunix') == 1 and vim.fn.findfile('/usr/local/lib/libxkbswitch.dylib')
  then
    vim.g.XkbSwitchEnabled = 0
  end
end

function Open_xkbsw()
  if vim.fn.has('macunix') == 1 and vim.fn.findfile('/usr/local/lib/libxkbswitch.dylib')
  then
    vim.g.XkbSwitchEnabled = 1
  end
end

if vim.fn.has('macunix') == 1 and vim.fn.findfile('/usr/local/lib/libxkbswitch.dylib')
then
  vim.g.XkbSwitchEnabled = 1
end
