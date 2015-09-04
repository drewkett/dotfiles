[ -z "$SSH_CLIENT" ] && [ -z "$INSIDE_EMACS" ] && [ "$TMUX" = "" ] && [ $(ps -o comm= -p $PPID) != "sshd" ] && tmux -2 new
#[ `uname` != "Darwin" ] && [ -z "$SSH_CLIENT" ] && [ -z "$INSIDE_EMACS" ] && [ "$TMUX" = "" ] && [ $(ps -o comm= -p $PPID) != "sshd" ] && tmux -2 new

autoload -U promptinit compinit colors
compinit
promptinit
colors

PROMPT="%(?, ,%F{red}FAIL: %?%F{default}
)
%F{green}(%n@%m)%F{yellow} %~ %F{default} 
$ "

RPROMPT="%F{default}%*%F{default}"

SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt HISTIGNORESPACE
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt AUTO_CD

bindkey -v
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search



if [[ `uname` == "Darwin" ]]; then 
  alias xem="open /Users/andrew/Applications/Emacs.app"
  alias em="emacs"
	bindkey "^[[A" up-line-or-beginning-search # Up
	bindkey "^[[B" down-line-or-beginning-search # Down
	bindkey "^[OA" up-line-or-beginning-search # Up
	bindkey "^[OB" down-line-or-beginning-search # Down
	alias ls="ls -G"
	alias brew_cask_upgrade=""
	export PATH="/Users/andrew/miniconda3/bin:$PATH"
	export PATH="/usr/local/sbin:$PATH"
	export SU2_RUN="/Users/andrew/dev/SU2/bin"
	export SU2_HOME="/Users/andrew/dev/SU2"
	export SU2_DBG_RUN="/Users/andrew/dev/SU2_dbg/bin"

	export DOCKER_HOST=tcp://192.168.59.103:2376
	export DOCKER_CERT_PATH=/Users/andrew/.boot2docker/certs/boot2docker-vm
	export DOCKER_TLS_VERIFY=1
else
  alias xem="emacsclient -c -n -a emacs"
  alias em="emacsclient -nw -c -a emacs"
	bindkey "^[[A" up-line-or-beginning-search # Up
	bindkey "^[[B" down-line-or-beginning-search # Down
	bindkey "^[OA" up-line-or-beginning-search # Up
	bindkey "^[OB" down-line-or-beginning-search # Down
	alias ls="ls -h --color=auto"
	export PATH=~/.local/bin:$PATH
	alias tree2="tree -C -F --dirsfirst --du -h -L 2"
	alias tree3="tree -C -F --dirsfirst --du -h -L 3"
	alias digocean="ssh -i ~/.ssh/digocean root@me.roofyard.com"
	alias nv="nvim"
	alias cp="cp --reflink=auto"

	export SU2_RUN="/home/andrew/dev/SU2/bin"
	export SU2_HOME="/home/andrew/dev/SU2"
	#export SU2_DBG_RUN="/home/andrew/dev/SU2_dbg/bin"

	alias upgrade="sudo pacmatic -Syu --ignore linux --ignore nvidia --noconfirm && yaourt -Su --aur --noconfirm"
	alias dist-upgrade="sudo pacmatic -Syu --noconfirm && yaourt -Su --aur --noconfirm"
	export PATH="/home/andrew/dev/SU2_cuda/bin:$PATH"

	export PATH=$PATH:/home/andrew/.gem/ruby/2.2.0/bin
	export PATH=$PATH:$HOME/.cabal/bin

	export PATH=$PATH:~/dev/naspy
	export PATH=/home/andrew/dev/esp8266/esp-open-sdk/xtensa-lx106-elf/bin:$PATH
fi

export PYTHON=python2
export PATH=$PATH:$SU2_RUN
export PYTHONPATH=$PYTHONPATH:$SU2_RUN
export PATH=$PATH:$SU2_DBG_RUN

alias mipython="ipython notebook --matplotlib=inline --port=7900 --notebook-dir=~/Dropbox/notebooks"

export PATH=~/dev/unstruc/bin:$PATH
export PATH=~/dev/cheaderguard:$PATH

export EDITOR=vim
export PYTHONPATH=~/dev/pylib:$PYTHONPATH

export ELM_HOME=~/.config/node_modules/lib/node/modules/elm/share

#export TERM=screen-256color
#export TERM=xterm-256color

disable -r time

export PATH=$PATH:~/bin
export PATH=$PATH:~/dev/pylib/scripts
export PATH=$PATH:~/.gem/ruby/1.9.1/bin
export PATH=$PATH:~/.config/node_modules/bin

export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

export _FASD_BACKENDS="native viminfo"
eval "$(fasd --init auto)"
alias o='a -e xdg-open'
