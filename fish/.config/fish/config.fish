if status is-interactive
    # Commands to run in interactive sessions can go here
end

# =====================fish config=====================
# >>> vi mode >>>
# Set the cursor shapes for the different vi modes.
fish_vi_key_bindings
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block
fish_user_key_bindings

alias config='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias ls='exa --icons'
alias ra='ranger'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/whcold/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
conda activate pytorch

set --universal pure_show_jobs true
starship init fish | source

