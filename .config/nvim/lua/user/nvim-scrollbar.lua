local status_ok, scrollbal = pcall(require, "scrollbar")
if not status_ok then
  return
end

scrollbal.setup()

require("scrollbar.handlers.search").setup()
