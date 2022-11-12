# for conf in "$HOME/.config/zsh/"*.zsh; do
#   source "${conf}"
# done
source "$HOME/.config/zsh/init.zsh"
# source "$HOME/.config/zsh/environment.zsh"
# source "$HOME/.config/zsh/alias.zsh"
# source "$HOME/.config/zsh/conda.zsh"
# source "$HOME/.config/zsh/update_path.zsh"
# source "$HOME/.config/zsh/command.zsh"

unset conf
#
# # Load the oh-my-zsh's library.
# antigen use oh-my-zsh
#
# # Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle git
# antigen bundle heroku
# antigen bundle pip
# antigen bundle lein
# antigen bundle command-not-found
#
# # Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle jeffreytse/zsh-vi-mode
#
#
# # Load the theme.
# antigen theme robbyrussell
#
# # Tell Antigen that you're done.
# antigen apply
#
# # enviroment
#
# command -v nvim >/dev/null && export EDITOR="$(which nvim)" || echo "neovim is not installed"
# [ -d "$HOME/dotfiles" ] && export DOTFILE_PATH="$HOME/dotfiles" || echo "dotfiles directory is not cloned to the home directory"
#
# alias vi=$(which nvim)
# alias lg='lazygit'
# alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
# alias ls='exa --icons'
# alias la='ls -a'
# alias ra='ranger'
# alias srk='sudo systemctl restart keyd.service'
# alias dils='docker image ls'
# alias dirm='docker image rm'
# alias dcls='docker container ls'
# alias dcla='docker container ls --all'
# alias dcrm='docker container rm'
# if [ -L ~/ebook ]; then
#     alias ebook='ranger ~/ebook'
# fi
# # eval
# ## for starship
# eval "$(starship init zsh)"
#
# # cmd
# neofetch
#
# # lazygit
# if command -v lazygit >/dev/null; then
#     if [ -f "$HOME/.config/lazygit/config.yml" ]; then
#         export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"
#     else
#         echo "config file for lazygit is not exist."
#     fi
#     if [ -n $DOTFILE_PATH ]; then
#         lgdot ()
#         {
#             lazygit -p $DOTFILE_PATH
#         }
#     fi
# else
#     echo "lazygit is not installed"
# fi
#
# # config for zsh-vim-mode
# ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# ZVM_VI_EDITOR=vi
# ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT # Always starting with insert mode for each command line
#
# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/wenhaoleng/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/wenhaoleng/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/wenhaoleng/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/wenhaoleng/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
# conda activate base
#
# # >>> local_install >>> {{{
# if [ -d "$HOME/local_install" ]; then
#     export LOCAL_INSTALL=$HOME/local_install
#     export PATH=$LOCAL_INSTALL/bin:$PATH
#     export LD_LIBRARY_PATH=$LOCAL_INSTALL/lib:$LOCAL_INSTALL/lib64:$LD_LIBRARY_PATH
#     if [ -d "$HOME/local_install/lib/pkgconfig" ]; then
#         export PKG_CONFIG_PATH="$LOCAL_INSTALL/lib/pkgconfig:"$PKG_CONFIG_PATH
#     fi
#     if [ -d "$HOME/local_install/share/pkgconfig" ]; then
#         export PKG_CONFIG_PATH="$LOCAL_INSTALL/share/pkgconfig:"$PKG_CONFIG_PATH
#     fi
# fi
# # }}}
#
# # >>> cross-compile tools >>> {{{
# if [ -d "$HOME/local_install/cross-tools" ]; then
#     export CROSS_COMPILE_TOOLS=$HOME/local_install/cross-tools
#     export PATH=$CROSS_COMPILE_TOOLS/bin:$PATH
# fi
# # }}}
# #
# # >>> gdb for m1 mac >>> {{{
# if [ -d "$HOME/local_install/gdb-for-m1" ]; then
#     export M1_GDB=$HOME/local_install/gdb-for-m1
#     export PATH=$M1_GDB/bin:$PATH
# fi
# # }}}
#
# # >>> cuda >>> {{{
# if [ -d "/usr/local/cuda" ]; then
#     export CUDA_PATH="/usr/local/cuda" 
#     export PATH=$CUDA_PATH/bin:$PATH  
#     export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH
# fi
# # }}}
#
# # >>> cpptools >>> {{{
# if [ -d "$HOME/local_install/download/cpptools" ]; then
#     export CPPTOOLS_PATH="$HOME/local_install/download/cpptools" 
# fi
# # }}}
#
# #
# if [ -d "$HOME/Qt/6.2.4/gcc_64" ]; then
#     export QT_PATH="$HOME/Qt/6.2.4/gcc_64"
#     export PATH=$QT_PATH/bin:$PATH 
#     export LD_LIBRARY_PATH=$QT_PATH/lib:$LD_LIBRARY_PATH
# fi
#
# if [ -d "$HOME/.emacs.d/bin" ]; then
#     export PATH=$HOME/.emacs.d/bin:$PATH  
# fi
#
# # bat
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#
# command -v nvim >/dev/null && export EDITOR="$(which nvim)" || echo "neovim is not installed"
#
# # ========================================= function ====================================================
# cpolar-ssh ()
# {
#     cpolar tcp 22 -remote-addr=1.tcp.cpolar.cn:24737
# }
#
# cpolar-proxy ()
# {
#     cpolar tcp 7890 -remote-addr=1.tcp.vip.cpolar.top:10327
# }
#
# cpolar-vnc ()
# {
#     cpolar tcp 5901 -remote-addr=1.tcp.cpolar.cn:22252
# }
# # ========================================= function ====================================================
