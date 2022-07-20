source $HOME/.config/antigen.zsh

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
alias srk='sudo systemctl restart keyd.service'
alias dils='docker image ls'
alias dirm='docker image rm'
alias dcls='docker container ls'
alias dcla='docker container ls --all'
alias dcrm='docker container rm'

# eval
## for starship
eval "$(starship init zsh)"

# cmd
neofetch

# config for zsh-vim-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_EDITOR=vi
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT # Always starting with insert mode for each command line

# >>> conda initialize >>>
## for conda 
if [[ $DISPLAY ]]; then
    eval "$(/home/whcold/miniconda3/bin/conda shell.zsh hook)"
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/whcold/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/whcold/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/whcold/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/whcold/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
    conda activate pytorch
fi

# >>> local_install >>> {{{
if [ -d "$HOME/local_install" ]; then
    export LOCAL_INSTALL=$HOME/local_install
    export PATH=$LOCAL_INSTALL/bin:$PATH
    export LD_LIBRARY_PATH=$LOCAL_INSTALL/lib:$LOCAL_INSTALL/lib64:$LD_LIBRARY_PATH
    if [ -d "$HOME/local_install/lib/pkgconfig" ]; then
        export PKG_CONFIG_PATH="$LOCAL_INSTALL/lib/pkgconfig:"$PKG_CONFIG_PATH
    fi
    if [ -d "$HOME/local_install/share/pkgconfig" ]; then
        export PKG_CONFIG_PATH="$LOCAL_INSTALL/share/pkgconfig:"$PKG_CONFIG_PATH
    fi
fi
# }}}

# >>> cross-compile tools >>> {{{
if [ -d "$HOME/cross_tools" ]; then
    export CROSS_COMPILE_TOOLS=$HOME/cross_tools
    export PATH=$CROSS_COMPILE_TOOLS/bin:$PATH
fi
# }}}

# >>> cuda >>> {{{
if [ -d "/usr/local/cuda" ]; then
    export CUDA_PATH="/usr/local/cuda" 
    export PATH=$CUDA_PATH/bin:$PATH  
    export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH
fi
# }}}

# >>> cpptools >>> {{{
if [ -d "$HOME/local_install/download/cpptools" ]; then
    export CPPTOOLS_PATH="$HOME/local_install/download/cpptools" 
fi
# }}}

#
if [ -d "$HOME/Qt/6.2.4/gcc_64" ]; then
    export QT_PATH="$HOME/Qt/6.2.4/gcc_64"
    export PATH=$QT_PATH/bin:$PATH 
    export LD_LIBRARY_PATH=$QT_PATH/lib:$LD_LIBRARY_PATH
fi

if [ -d "$HOME/.emacs.d/bin" ]; then
    export PATH=$HOME/.emacs.d/bin:$PATH  
fi

# bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export EDITOR="$(which nvim)"

