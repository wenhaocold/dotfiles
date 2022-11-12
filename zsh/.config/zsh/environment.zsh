
# EDITOR:
command -v nvim >/dev/null && export EDITOR="$(which nvim)" || echo "neovim is not installed"
#
# DOTFILE_PATH: path of dotfiles
[ -d "$HOME/dotfiles" ] && export DOTFILE_PATH="$HOME/dotfiles" || echo "dotfiles directory is not cloned to the home directory"

# LG_CONFIG_FILE: config file for lazygit
if [ -f "$HOME/.config/lazygit/config.yml" ]; then
    export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"
fi

# MANPAGER: use bat to rice manpage
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
