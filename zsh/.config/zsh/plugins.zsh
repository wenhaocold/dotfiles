if [[ ! -f "$HOME/antigen.zsh" ]]; then
    echo "antigen.zsh is not exist in HOME dirctory, downloading it:"
    curl -L git.io/antigen > "$HOME/antigen.zsh"
fi

source $HOME/antigen.zsh

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

