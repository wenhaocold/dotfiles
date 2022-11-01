require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})

require("luasnip").config.set_config({
  enable_autosnippets = true,
  store_selection_keys = "<c-s>",
  update_events = 'TextChanged,TextChangedI'
})
