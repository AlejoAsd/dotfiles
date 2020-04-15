# kubectl specific configs
alias k='kubectl'
alias ki='kubectl --kubeconfig=$HOME/.kube/config_integration'
alias kin='kubectl --kubeconfig=$HOME/.kube/config_integration -n kube-system'
alias ki1='kubectl --kubeconfig=$HOME/.kube/config_integration-1'
alias kt='kubectl --kubeconfig=$HOME/.kube/config_test'

alias ki1n='kubectl --kubeconfig=$HOME/.kube/config_integration-1 -n kube-system'
alias ks='kubectl --kubeconfig=$HOME/.kube/config_staging'
alias ksn='kubectl --kubeconfig=$HOME/.kube/config_staging -n kube-system'
alias kp='kubectl --kubeconfig=$HOME/.kube/config_production'
alias kpn='kubectl --kubeconfig=$HOME/.kube/config_production -n kube-system'
alias ktn='kubectl --kubeconfig=$HOME/.kube/config_test -n kube-system'
