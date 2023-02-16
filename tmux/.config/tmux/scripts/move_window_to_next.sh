window_index=$(tmux display-message -p "#{window_index}")
window_end_flag=$(tmux display-message -p "#{window_end_flag}")

if [[ $window_end_flag -ne 1 ]]
then
    tmux move-window -a -t $((window_index + 1))
else
    tmux move-window -b -t 1
fi
