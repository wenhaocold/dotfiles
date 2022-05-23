vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    relative_width = true,
    width = 25,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {
      'File',
      'Module',
      'Namespace',
      'Package',
      'Class',
      'Method',
      'Property',
      'Field',
      'Constructor',
      'Enum',
      'Interface',
      -- 'Function',
      'Variable',
      'Constant',
      'String',
      'Number',
      'Boolean',
      'Array',
      'Object',
      'Key',
      'Null',
      'EnumMember',
      'Struct',
      'Event',
      'Operator',
      'TypeParameter',
    },
}
