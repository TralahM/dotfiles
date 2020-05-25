export ZSH=~/.zsh
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export DEFAULT_USER="$(whoami)"
export GREP_COLORS='ms=01;32;49'
export GREP_OPTIONS='--color=always'
# Vulkan Graphics Library setup
export VULKAN_SDK=~/vulkan/1.2.135.0/x86_64
export PATH=$PATH:$VULKAN_SDK/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VULKAN_SDK/lib
export VK_LAYER_PATH=$VULKAN_SDK/etc/vulkan/explicit_layer.d

# display how long all tasks over 10 seconds take
export REPORTTIME=10
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_241/
unset JAVA_OPTS
[[ -e ~/.terminfo ]] && export TERMINFO_DIRS=~/.terminfo:/data/data/com.termux/files/usr/share/terminfo
if [[ -e ~/.localenv ]];then
    source ~/.localenv
fi
if command -v tmux &> /dev/null && [ -z "$TMUX" ];then
    clear;
fi

# define the code directory
# This is where my code exists and where I want the `c` autocomplete to work from exclusively
if [[ -d ~/code ]]; then
    export CODE_DIR=~/code
fi

# source all .zsh files inside of the zsh/ directory
source "$ZSH/utils.zsh"
source "$ZSH/prompt.zsh"
source "$ZSH/aliases.zsh"
source "$ZSH/colors.zsh"
source "$ZSH/completion.zsh"
source "$ZSH/config.zsh"
source "$ZSH/functions.zsh"
source "$ZSH/git.zsh"
source "$ZSH/tmux.zsh"
source "$ZSH/z.zsh"

if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi



export EDITOR='vim'
export GIT_EDITOR='vim'

export PATH=/data/data/com.termux/files/usr/local/bin:$PATH

# add /usr/local/sbin
if [[ -d /data/data/com.termux/files/usr/local/sbin ]]; then
    export PATH=/data/data/com.termux/files/usr/local/sbin:$PATH
fi

# adding path directory for custom scripts
#export PATH=$DOTFILES/bin:$PATH

# check for custom bin directory and add to path
if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
    source ~/bin/tmux-completion/tmux
fi

if [[ -d ~/.rbenv ]]; then
    export PATH=$PATH:~/.rbenv/bin
fi
eval "$(rbenv init -)"

if [[ -d ~/.cargo/bin/ ]]; then
    export PATH=~/.cargo/bin/:$PATH
fi
# add a config file for ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"
# alias git to hub
if type hub > /dev/null 2>&1; then
    eval "$(alias hub='git')"
fi

# move to next word with ctrl-F
bindkey -M viins "^F" vi-forward-word
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

export PATH=/home/african/.local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/go/lib:$LD_LIBRARY_PATH

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_VI_INSERT_MODE_STRING='INSERT'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='NORMAL'
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# add shellcheck config
# For a full list of errors, refer to
# https://github.com/koalaman/shellcheck/wiki
#
# export SHELLCHECK_OPTS=""
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source  ~/powerlevel9k/powerlevel9k.zsh-theme
export SHODAN_API=6sfgFBXP0xZ5CmDwqgtKSNmTGODaac1f
alias grep="egrep --color "
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias gpom="git push origin master"
alias pythonx="python"
alias gpfo="git fetch origin"
alias gpum="git pull origin master"
alias gpud="git pull origin develop"
alias gpod="git push origin develop:develop"
alias gphum="git pull heroku master"
alias gphm="git push heroku master"
alias grs="git remote set-url "
alias cls="clear"
alias pubip="curl icanhazip.com"
alias vim="nvim --startuptime ~/stime"
alias vf="vifm"
alias hli="heroku login -i"
alias herokulogs="heroku logs -t"
alias herokupyshell="heroku run python manage.py shell_plus"
alias herokubash="heroku run bash"
alias djsp="django-admin startproject "
alias djsa="django-admin startapp "
alias ghrc="gcli repo create "
alias grao="git remote add origin "
alias yt="youtube-dl"
alias scrapy="~/anaconda3/bin/scrapy"

# export PYTHONHOME="/usr/bin/python3"
export ANDROIDSDK="/home/african/Android/Sdk"
export ANDROIDNDK="/home/african/android-ndk-r18b"
export ANDROIDAPI="26"
export NDKAPI="19"
export ANDROIDNDKVER="r18b"
export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'

export PATH=/home/african/anaconda3/bin:$PATH
export PATH=/home/african/Android/Sdk/tools/bin:/home/african/android-studio/bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion"  ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
local node_version="$(nvm version)"
local nvmrc_path="$(nvm_find_nvmrc)"
if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# # Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
# export PYTHONPATH=/home/anaconda3/lib/python3.6:/home/anaconda3/lib/python3.7:/usr/lib/python3.7:/usr/lib/python3.6:/usr/lib/python3.6:
export G_ML_API=AIzaSyDrAjzK8u-_Y0_YJmY7Yk1K6N_q1p8Bd8w
alias ls="ls --color=auto -t "
#
# start a tmux session

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/african/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/african/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/african/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/african/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# added by travis gem
[ -f /home/african/.travis/travis.sh ] && source /home/african/.travis/travis.sh
# unset PYTHONPATH
# export PYTHONHOME=/home/african/anaconda/lib/python3.7:/home/african/anaconda3/bin/python
# export PYTHONPATH=$PYTHONPATH:$PYTHONHOME:/home/anaconda/lib/python3.7
# Golang home config
export GOHOME=~/gocode
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/home/african/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
# alias hub to git
eval $(hub alias -s)
# Rust src path
export RUST_SRC_PATH=/home/african/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

bindkey -v

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk
zplugin light webyneter/docker-aliases
zplugin light dbkaplun/smart-cd
zplugin light oldratlee/hacker-quotes
zplugin light "chrissicool/zsh-256color"
zplugin light "olets/zsh-abbr"
zplugin light marlonrichert/zsh-autocomplete
zplugin light Tarrasch/zsh-bd
zplugin light "arzzen/calc.plugin.zsh"
zplugin light "momo-lab/zsh-abbrev-alias"
zplugin light mtxr/zsh-change-case
zplugin light "changyuheng/fz"
zplugin light "rupa/z"

fpath=(~/.zsh/completions $fpath)
fpath=(~/.zplugin/completions/_zplugin $fpath)
autoload -U compinit && compinit
zplugin light "hlissner/zsh-autopair"
bindkey '^K^U' _mtxr-to-upper # Ctrl+K + Ctrl+U
bindkey '^K^L' _mtxr-to-lower # Ctrl+K + Ctrl+L

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/home/african/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
