##### oscyank
The default config of this plugin can not work properly when i use neovim in tmux. There are two things need to config to make it cooperate nice with tmux.
1. add `vim.g.oscyank_term = "default"` in neovim config.
2. add `set -s set-clipboard on` in ~/.tmux.conf
