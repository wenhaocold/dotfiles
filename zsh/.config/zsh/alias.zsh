# $1: alias name
# $2: command
# $3: command option
function _alias()
{
    command -v $2 >/dev/null && alias $1="$(which $2) $3" || echo "$2 is not installed"
}

_alias vi nvim
_alias lg lazygit
_alias ls exa --icons
alias la='ls -a'
_alias ra ranger
[[ -L "$HOME/ebook" ]] && alias ebook='ranger $HOME/ebook'

# alias dils='docker image ls'
# alias dirm='docker image rm'
# alias dcls='docker container ls'
# alias dcla='docker container ls --all'
# alias dcrm='docker container rm'

# alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
# alias srk='sudo systemctl restart keyd.service'

unset _alias
