#
# ~/.bashrc
#
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export DEFAULT_USER="$(whoami)"
export GREP_COLORS='ms=01;32;49'
if command -v tmux &> /dev/null && [ -z "$TMUX" ];then
    clear;ls
fi

shopt -s autocd
export HADOOP_HOME=/home/hadoop/hadoop-2.7.7
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
export SPARK_HOME=~/spark-3.0.0-preview2-bin-hadoop2.7
export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
export PYSPARK_PYTHON=python3
# export PYTHONHOME="/usr/bin/python3"
# export ANDROIDSDK="/home/african/Android/Sdk"
# export ANDROIDNDK="/home/african/android-ndk-r18b"

export PATH=~/anaconda3/bin:$PATH
# export PATH=/home/african/Android/Sdk/tools/bin:/home/african/android-studio/bin:$PATH

# # Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
# export PYTHONPATH=/home/anaconda3/lib/python3.6:/home/anaconda3/lib/python3.7:/usr/lib/python3.7:/usr/lib/python3.6:/usr/lib/python3.6:
#
# start a tmux session

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/african/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f ~/anaconda3/etc/profile.d/conda.sh ]; then
        . ~/anaconda3/etc/profile.d/conda.sh
    else
        export PATH=~/anaconda3/bin:$PATH
    fi
fi
unset __conda_setup

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
# unset PYTHONPATH
# export PYTHONHOME=/home/african/anaconda/lib/python3.7:/home/african/anaconda3/bin/python
# export PYTHONPATH=$PYTHONPATH:$PYTHONHOME:/home/anaconda/lib/python3.7
# Golang home config
export GOHOME=~/gocode
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias hub to git
eval $(hub alias -s)
# Rust src path
export RUST_SRC_PATH=/home/african/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# add color to man pages
export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

export POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_VI_INSERT_MODE_STRING='INSERT'
export POWERLEVEL9K_VI_COMMAND_MODE_STRING='NORMAL'
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# check for custom bin directory and add to path
if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
    # source ~/bin/tmux-completion/tmux
fi

# if [[ -d ~/.rbenv ]]; then
#     export PATH=$PATH:~/.rbenv/bin
#     eval "$(rbenv init -)"
# fi

if [[ -d ~/.cargo/bin/ ]]; then
    export PATH=~/.cargo/bin/:$PATH
fi
# add a config file for ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"
# alias git to hub
if type hub > /dev/null 2>&1; then
    eval "$(alias hub='git')"
fi

export EDITOR='nvim'
export GIT_EDITOR='nvim'

[[ $- != *i* ]] && return

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

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|urxvt*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh

alias cp="cp -r"
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
exarch ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
# export SHELLCHECK_OPTS=""
alias grep="egrep --color "
alias norg="gron --ungron"
alias ungron="gron --ungron"
alias gad="git add ."
alias gap="git add -p"
alias gaci="git add .;git commit "
alias gp="git push "
alias gpom="git push origin master"
alias pythonx="python"
alias gpf="git fetch "
alias gpum="git pull origin master"
alias gphum="git pull heroku master"
alias gphm="git push heroku master"
alias grs="git remote set-url "
alias cls="clear"
alias pubip="curl icanhazip.com"
alias vim="nvim "
alias vf="vifm"
alias hrkli="heroku login -i"
alias hrklgs="heroku logs -t"
alias hrkpyshl="heroku run python manage.py shell_plus"
alias hrkbsh="heroku run bash"
alias djsp="django-admin startproject "
alias djsa="django-admin startapp "
alias ghrpc="hub create "
alias grao="git remote add origin "
alias yt="youtube-dl -ic --add-metadata"
alias yta="youtube-dl -xic --add-metadata" # Download only audio
alias scrapy="~/anaconda3/bin/scrapy"
alias ipy="ipython"
alias jpynb="jupyter-notebook . &"
alias ls="ls -hN --color=auto -t "
alias v="nvim"
alias ccat="highlight --out-format=ansi"
alias psaux="ps -aux"
alias sv="sudo nvim"
alias p="sudo pacman"
alias vbsh="nvim ~/.bashrc"
alias vzsh="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"
alias ka="kill -9"

md(){
    mkdir -p $1;
    cd $1;
    pwd;
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
