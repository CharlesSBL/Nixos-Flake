# Source system-wide custom bash commands if available
if [ -f /etc/bashrc-custom ]; then
    . /etc/bashrc-custom
fi