#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# TMUX
if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux attach-session -t local || tmux new-session -s local 'tmux source-file ~/.config/.tmux/.local.layout.conf')
fi

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# HELM aliases
alias helmtls='helm --tiller-namespace=core-infrastructure'
alias helm-integration='helm --kube-context integration'
alias helm-stage='helmtls --kube-context stage'
alias helm-production='helmtls --kube-context production-core-tiller'
alias helm-core='helm --kube-context core'
alias helm-local='helm --kube-context minikube'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

source ~/.git-completion.bash
source ~/.git-prompt.sh

case "$TERM" in
        tmux|screen*|xterm*|rxvt*|mysql)
                PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\]\w\[\033[1;35m\]$(__git_ps1 " [%s]") \[\033[01;33m\][$(kubectl config current-context)]\[\033[01;34m\] \$\[\033[00m\] '
                ;;
        *)
                ;;
esac

# gradlecompletion
if [ -f $HOME/.gradle-completion.bash ]; then
    source $HOME/.gradle-completion.bash
fi

export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=
export HISTSIZE=
shopt -s histappend
# After each command, append to the history file and reread it
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export EDITOR=/usr/bin/vim
export KUBECONFIG="$HOME/.kube/config.local:$HOME/.kube/config.integration:$HOME/.kube/config.stage:$HOME/.kube/config.production"

