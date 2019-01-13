#!/bin/bash
tmux new-session \; split-window -v \; resize-pane -y 6\; rename-window ${1} \; attach
