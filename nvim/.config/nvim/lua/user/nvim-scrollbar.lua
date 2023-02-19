local status_ok, scrollbal = pcall(require, "scrollbar")
if not status_ok then
  return
end

local colors = require("tokyonight.colors").setup()
require("scrollbar").setup({
    handle = {
      color = "#393053",
      text = " ",
    },
    marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
    }
})
require("scrollbar.handlers.search").setup()
