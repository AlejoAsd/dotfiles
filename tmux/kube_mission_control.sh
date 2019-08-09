#!/bin/bash
tmux new-session -d 'watch -n10 kubectl --kubeconfig=$KUBECONFIG get nodes' 
tmux split-window -v 'watch -n10 kubectl --kubeconfig=$KUBECONFIG get pods' 
tmux split-window -v 'watch -n10 kubectl --kubeconfig=$KUBECONFIG get networkpolicies'
tmux resize-pane -y6 -t 0
tmux resize-pane -y35 -t 2
tmux attach-session
