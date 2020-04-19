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
	ssh-add ~/.ssh/github
fi

alias px='ps ax | grep '
alias cdc='cd $HOME/.config'
alias screenshot='sh ~/dotfiles/scripts/screenshot-tool.sh'
alias pic-uploader='sh ~/dotfiles/scripts/pic-uploader.sh'
alias ls='ls --color=auto'
alias httpd='hostname -i && python3 -m http.server 8001'
alias ace='acestream-launcher -p vlc'

alias homeserver='ssh 192.168.2.4'

alias dotfiles='sh ~/dotfiles/dotfiles.sh'

alias mullvad='sh ~/dotfiles/scripts/mullvad.sh'

alias stickm='sh ~/dotfiles/scripts/mount-stick.sh'
alias stickum='sh ~/dotfiles/scripts/umount-stick.sh'

cat ~/.cache/wal/sequences

# extract archives
e() {
 if [ -f $1 ] ; then
  case $1 in
   *.tar.bz2)   tar xjvf $1 ;;
   *.tar.gz)    tar xzvf $1 ;;
   *.tar.xz)    tar xJvf $1 ;;
   *.bz2)       bunzip2 $1 ;;
   *.rar)       unrar xv $1 ;;
   *.gz)        gunzip $1 ;;
   *.tar)       tar xvf $1 ;;
   *.tbz2)      tar xjvf $1 ;;
   *.tgz)       tar xzvf $1 ;;
   *.zip)       unzip $1 ;;
   *.7z)        7z $1 ;;
   *.xz)        xz -vd $1 ;;
   *)           echo "'$1' cannot be extracted via extract()" ;;
  esac
 else
  echo "'$1' is not a valid file"
 fi
}

# create folder and cd into
mkd() { mkdir -p "$@" && cd "$@"; }
