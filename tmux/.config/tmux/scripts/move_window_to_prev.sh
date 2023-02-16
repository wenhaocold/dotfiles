window_index=$(tmux display-message -p "#{window_index}")
window_num=$(tmux display-message -p "#{session_windows}")

if [[ $window_index -ne 1 ]]
then
    tmux move-window -b -t $((window_index - 1))
else
    tmux move-window -a -t $window_num
fi

