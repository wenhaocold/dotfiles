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
alias ll='ls -l'
alias lld='ls -ld'
_alias ra ranger
[[ -L "$HOME/ebook" ]] && alias ebook='ranger $HOME/ebook'

_alias tmls tmux "ls"
_alias tmat tmux "attach -t"
# alias dils='docker image ls'
# alias dirm='docker image rm'
# alias dcls='docker container ls'
# alias dcla='docker container ls --all'
# alias dcrm='docker container rm'

# alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
# alias srk='sudo systemctl restart keyd.service'

unset _alias
