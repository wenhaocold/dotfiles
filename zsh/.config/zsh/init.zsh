source "$HOME/.config/zsh/plugins.zsh"

# starship
eval "$(starship init zsh)"

# fnm
eval "$(fnm env --use-on-cd)"

# fastfetch

# config for zsh-vim-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_EDITOR=vi
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT # Always starting with insert mode for each command line

source "$HOME/.config/zsh/environment.zsh"
source "$HOME/.config/zsh/alias.zsh"
# source "$HOME/.config/zsh/conda.zsh"
source "$HOME/.config/zsh/update_path.zsh"
source "$HOME/.config/zsh/command.zsh"


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
