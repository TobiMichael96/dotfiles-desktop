#
# ~/.bashrc
#

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
	eval "$(<~/.ssh-agent-thing)"
	ssh-add ~/.ssh/raspi
	ssh-add ~/.ssh/gitlab
	ssh-add ~/.ssh/amazon.pem
fi

alias px='ps ax | grep '
alias cdc='cd $HOME/.config'
alias screenshot='sh ~/dotfiles/scripts/screenshot-tool.sh'
alias ls='ls --color=auto'
alias httpd='hostname -i && python3 -m http.server 8001'

alias homeserver='ssh 192.168.2.4'

alias dotfiles='sh ~/dotfiles/dotfiles.sh'

alias stickm='sh ~/dotfiles/scripts/mount-stick.sh'
alias stickum='sh ~/dotfiles/scripts/umount-stick.sh'


PS1='[\u@\h \W]\$ '

cat ~/.cache/wal/sequences
