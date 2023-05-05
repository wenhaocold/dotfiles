vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change default icon
local status_ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end
nvim_web_devicons.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  py = {
    icon = "",
    color = "#6398B7",
    cterm_color = "65",
    name = "Python"
  },
  Makefile = {
    icon = "",
    color = "#E37834",
    cterm_color = "65",
    name = "Makefile"
  },
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
  return
end

local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'O', '', { buffer = bufnr })
  vim.keymap.del('n', 'O', { buffer = bufnr })
  vim.keymap.set('n', '<2-RightMouse>', '', { buffer = bufnr })
  vim.keymap.del('n', '<2-RightMouse>', { buffer = bufnr })
  vim.keymap.set('n', 'D', '', { buffer = bufnr })
  vim.keymap.del('n', 'D', { buffer = bufnr })
  vim.keymap.set('n', 'E', '', { buffer = bufnr })
  vim.keymap.del('n', 'E', { buffer = bufnr })

  vim.keymap.set('n', 'l', api.node.open.edit, { buffer = bufnr })
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, { buffer = bufnr })

  vim.keymap.set('n', 'A', api.tree.expand_all, opts('Expand All'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'P', function()
    local node = api.tree.get_node_under_cursor()
    print(node.absolute_path)
  end, opts('Print Node Path'))

  vim.keymap.set('n', 'Z', api.node.run.system, opts('Run System'))
end

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 25,
    side = "left",
    number = false,
    relativenumber = false,
  },
  on_attach = my_on_attach,
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  renderer = {
    full_name = true,
    root_folder_label = false,
    add_trailing = true,
    group_empty = false,
    highlight_git = true,
    highlight_opened_files = "icon",
    root_folder_modifier = ":~",
    indent_width = 1,
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = false,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  }
}
