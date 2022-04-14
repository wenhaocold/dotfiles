local orgmode_status_ok, orgmode = pcall(require, "orgmode")
if not orgmode_status_ok then
  return
end

-- Load custom tree-sitter grammar for org filetype
orgmode.setup_ts_grammar()


orgmode.setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})

-- org-bullets
local orgbullets_status_ok, org_bullets = pcall(require, "org-bullets")
if not orgbullets_status_ok then
  return
end

org_bullets.setup {
    symbols = { "◉", "○", "✸", "✿" },
  }

-- conceal link
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
