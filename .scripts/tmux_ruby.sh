#!/usr/bin/env bash

WD=$(tmux display-message -p -F "#{pane_current_path}")
echo $WD

tmux new-window -c "$WD" -n editor "vim"
tmux new-window -c "$WD" -n misc ""
tmux new-window -c "$WD" -n server "bin/rails server"
