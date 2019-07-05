# Add AWS Elastic Beanstalk executables to PATH if eb is installed
if [ -d "$HOME/.ebcli-virtual-env" ]; then
    export PATH="$HOME/.ebcli-virtual-env/executables:$PATH"
fi
