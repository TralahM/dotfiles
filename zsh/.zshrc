## Options section
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=5000
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

## Alias section
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'

# Theming section
autoload -U compinit colors zcalc
compinit -d
colors

# enable substitution for prompt
setopt prompt_subst

# Prompt (on left side) similar to default bash prompt, or redhat zsh prompt with colors
 #PROMPT="%(!.%{$fg[red]%}[%n@%m %1~]%{$reset_color%}# .%{$fg[green]%}[%n@%m %1~]%{$reset_color%}$ "
# Maia prompt
PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b " # Print some system information when the shell is first started
# Print a greeting message when shell is started
echo $USER@$HOST  $(uname -srm) $(lsb_release -rcs)
## Prompt on right side:
#  - shows status of git when in git repository (code adapted from https://techanic.net/2012/12/30/my_git_prompt_for_zsh.html)
#  - shows exit status of previous command (if previous command finished with an error)
#  - is invisible, if neither is the case

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"                              # plus/minus     - clean repo
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"             # A"NUM"         - ahead by "NUM" commits
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"           # B"NUM"         - behind by "NUM" commits
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"     # lightning bolt - merge conflict
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"       # red circle     - untracked files
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"     # yellow circle  - tracked files modified
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"        # green circle   - staged changes present = ready for "git push"

parse_git_branch() {
  # Show Git branch/tag, or name-rev if on detached head
  ( git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD ) 2> /dev/null
}

parse_git_state() {
  # Show different symbols as appropriate for various Git repository states
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi
  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi
  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

git_prompt_string() {
  local git_where="$(parse_git_branch)"

  # If inside a Git repository, print its branch and state
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"

  # If not inside the Git repo, print exit codes of last command (only if it failed)
  [ ! -n "$git_where" ] && echo "%{$fg[red]%} %(?..[%?])"
}

# Right prompt with exit status of previous command if not successful
 #RPROMPT="%{$fg[red]%} %(?..[%?])"
# Right prompt with exit status of previous command marked with ✓ or ✗
 #RPROMPT="%(?.%{$fg[green]%}✓ %{$reset_color%}.%{$fg[red]%}✗ %{$reset_color%})"


# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Apply different settigns for different terminals
case $(basename "$(cat "/proc/$PPID/comm")") in
  login)
    	RPROMPT="%{$fg[red]%} %(?..[%?])"
    	alias x='startx ~/.xinitrc'      # Type name of desired desktop after x, xinitrc is configured for it
    ;;
#  'tmux: server')
#        RPROMPT='$(git_prompt_string)'
#		## Base16 Shell color themes.
#		#possible themes: 3024, apathy, ashes, atelierdune, atelierforest, atelierhearth,
#		#atelierseaside, bespin, brewer, chalk, codeschool, colors, default, eighties,
#		#embers, flat, google, grayscale, greenscreen, harmonic16, isotope, londontube,
#		#marrakesh, mocha, monokai, ocean, paraiso, pop (dark only), railscasts, shapesifter,
#		#solarized, summerfruit, tomorrow, twilight
#		#theme="eighties"
#		#Possible variants: dark and light
#		#shade="dark"
#		#BASE16_SHELL="/usr/share/zsh/scripts/base16-shell/base16-$theme.$shade.sh"
#		#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
#		# Use autosuggestion
#		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
#  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
#     ;;
  *)
        RPROMPT='$(git_prompt_string)'
		# Use autosuggestion
		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30
  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ;;
esac
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.zsh
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export DEFAULT_USER="$(whoami)"
export GREP_COLORS='ms=01;32;49'

# Vulkan Graphics Library setup
export VULKAN_SDK=~/vulkan/1.2.135.0/x86_64
export PATH=$PATH:$VULKAN_SDK/bin
export PATH=$PATH:$GOHOME/bin:~/go/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VULKAN_SDK/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/:/usr/lib/
export VK_LAYER_PATH=$VULKAN_SDK/etc/vulkan/explicit_layer.d

# Texlive tlmngr
PATH=/usr/local/texlive/2020/bin/x86_64-linux:$PATH; export PATH
MANPATH=/usr/local/texlive/2020/texmf-dist/doc/man:$MANPATH; export MANPATH
INFOPATH=/usr/local/texlive/2020/texmf-dist/doc/info:$INFOPATH; export INFOPATH

# Snap apps to path
export PATH=$PATH:/snap/bin

# display how long all tasks over 10 seconds take
export REPORTTIME=10
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_241/
unset JAVA_OPTS
[[ -e ~/.terminfo ]] && export TERMINFO_DIRS=~/.terminfo:/data/data/com.termux/files/usr/share/terminfo
if [[ -e ~/.localenv ]];then
    source ~/.localenv
fi
if [[ -e ~/.profile ]];then
    source ~/.profile
fi
if command -v tmux &> /dev/null && [ -z "$TMUX" ];then
    clear;ls
fi
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
export PATH=$SPARK_HOME:$PATH:$JAVA_HOME/jre/bin

export PATH=/home/african/.local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/go/lib:$LD_LIBRARY_PATH

# Snap aps
export PATH=$PATH:/snap/bin
# define the code directory
# This is where my code exists and where I want the `c` autocomplete to work from exclusively
if [[ -d ~/code ]]; then
    export CODE_DIR=~/code
fi



if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi



export EDITOR='nvim'
export GIT_EDITOR='nvim'


# add /usr/local/sbin
if [[ -d /data/data/com.termux/files/usr/local/sbin ]]; then
    export PATH=/data/data/com.termux/files/usr/local/sbin:$PATH
	export PATH=/data/data/com.termux/files/usr/local/bin:$PATH
fi

# adding path directory for custom scripts
#export PATH=$DOTFILES/bin:$PATH

# check for custom bin directory and add to path
if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
    # source ~/bin/tmux-completion/tmux
fi

if [[ -d ~/.rbenv ]]; then
    export PATH=$PATH:~/.rbenv/bin
    eval "$(rbenv init -)"
fi

if [[ -d ~/.cargo/bin/ ]]; then
    export PATH=~/.cargo/bin/:$PATH
fi
# add a config file for ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"
# alias git to hub
if type hub > /dev/null 2>&1; then
    eval "$(alias hub='git')"
fi

md(){
    mkdir -p $1;
    cd $1;
    pwd;
}
# move to next word with ctrl-F
bindkey -M viins "^F" vi-forward-word
bindkey -M viins "^[" vi-backward-word
# Move to end of line with ctrl-E
bindkey -M viins "^E" vi-add-eol

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
typeset -g POWERLEVEL9K_VCS_GIT_ICON=$'\uF113 '
export POWERLEVEL9K_VCS_GIT_ICON='  '
# add shellcheck config
# For a full list of errors, refer to
# https://github.com/koalaman/shellcheck/wiki
#
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
alias ghrc="gcli repo create "
alias grao="git remote add origin "
alias yt="youtube-dl"
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
alias cp="cp -r"


# export PYTHONHOME="/usr/bin/python3"
# export ANDROIDSDK="/home/african/Android/Sdk"
# export ANDROIDNDK="/home/african/android-ndk-r18b"
if [[ -d ~/anaconda3/bin ]];then
    export PATH=~/anaconda3/bin:$PATH
fi
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

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/home/african/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
# alias hub to git
eval $(hub alias -s)
# Rust src path
export RUST_SRC_PATH=/home/african/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

bindkey -v

source ~/.profile



### Added by Zplugin's installer
#
source "$HOME/.zinit/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk
zplugin light webyneter/docker-aliases
zplugin light dbkaplun/smart-cd
zplugin light oldratlee/hacker-quotes
zplugin light "chrissicool/zsh-256color"
zplugin light "olets/zsh-abbr"
# zplugin light marlonrichert/zsh-autocomplete
zplugin ice "bhilburn/powerlevel9k"
zplugin light Tarrasch/zsh-bd
zplugin light "arzzen/calc.plugin.zsh"
zplugin light "momo-lab/zsh-abbrev-alias"
zplugin light mtxr/zsh-change-case
zplugin light "changyuheng/fz"
zplugin light "rupa/z"
zplugin light "softmoth/zsh-vim-mode"
zplugin ice depth=1; zplugin light romkatv/powerlevel10k

fpath=(~/.zsh/completions $fpath)
fpath=(~/.zplugin/completions/_zplugin $fpath)
# initialize autocomplete
autoload -U compinit add-zsh-hook
compinit

for config ($ZSH/completion.zsh) source $config;
autoload -U compinit && compinit
zplugin light "hlissner/zsh-autopair"
bindkey '^K^U' _mtxr-to-upper # Ctrl+K + Ctrl+U
bindkey '^K^L' _mtxr-to-lower # Ctrl+K + Ctrl+L

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/home/african/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

PATH="/home/african/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/african/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/african/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/african/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/african/perl5"; export PERL_MM_OPT;
### End of Zinit's installer chunk
### End of Zinit's installer chunk
### End of Zinit's installer chunk
### End of Zinit's installer chunk
# Put this in .zshrc, after this plugin is loaded
bindkey -v
