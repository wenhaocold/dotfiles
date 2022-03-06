source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jeffreytse/zsh-vi-mode


# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply


alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias ls='exa --icons'
alias ra='ranger'

# eval
## for starship
eval "$(starship init zsh)"
## for conda 
eval "$(/home/whcold/miniconda3/bin/conda shell.zsh hook)"

# cmd
neofetch

# config for zsh-vim-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_EDITOR=vi
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT # Always starting with insert mode for each command line
