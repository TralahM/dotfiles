# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.zsh
export LANG="en_US.UTF-8"
export DEFAULT_USER="$(whoami)"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_VI_INSERT_MODE_STRING='INSERT'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='NORMAL'
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=1


# display how long all tasks over 10 seconds take
export REPORTTIME=10
[[ -e ~/.terminfo ]] && export TERMINFO_DIRS=~/.terminfo:/data/data/com.termux/files/usr/share/terminfo
if [[ -e ~/.localenv ]];then
    source ~/.localenv
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


# initialize autocomplete
autoload -U compinit add-zsh-hook
compinit

for config ($ZSH/completion.zsh) source $config;

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
fi

# add a config file for ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.rgrc"
# alias git to hub
if type hub > /dev/null 2>&1; then
    eval "$(hub alias -s)"
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

export PATH=~/.local/bin:$PATH

# add shellcheck config
# For a full list of errors, refer to
# https://github.com/koalaman/shellcheck/wiki
#
# export SHELLCHECK_OPTS=""
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source  ~/powerlevel9k/powerlevel9k.zsh-theme
export SHODAN_API=6sfgFBXP0xZ5CmDwqgtKSNmTGODaac1f
alias cls="clear"
alias vim="nvim"
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias git="hub"
alias vf="vifm"
alias gpom="git push origin master"
alias gpod="git push origin develop:develop"
alias pythonx="python"
alias gpum="git pull origin master"
alias gpud="git pull origin develop:develop"
alias gphm="git push heroku master"
alias grs="git remote set-url origin "
alias grao="git remote add origin "
alias herokulogs="heroku logs -t"
alias herokupyshell="heroku run python manage.py shell_plus"
alias herokubash="heroku run bash"
alias xclip="termux-clipboard-set"
export ghrepo="git@github.com:TralahM"
export glrepo="git@gitlab.com:TralahM"
export htrepo="https://github.com"
export ltrepo="https://gitlab.com"
alias yt="youtube-dl "

export ANDROIDSDK="~/Android/Sdk"
export ANDROIDNDK="~/android-ndk-r18b"
export ANDROIDAPI="26"
export NDKAPI="19"
export ANDROIDNDKVER="r18b"
export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'

export PATH=~/anaconda3/bin:$PATH
export PATH=~/Android/Sdk/tools/bin:~/android-studio/bin:$PATH
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# [ -s "$NVM_DIR/bash_completion"  ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# # place this after nvm initialization!
# autoload -U add-zsh-hook
# load-nvmrc() {
# local node_version="$(nvm version)"
# local nvmrc_path="$(nvm_find_nvmrc)"
# # if [ -n "$nvmrc_path" ]; then
# #     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
# #     if [ "$nvmrc_node_version" = "N/A" ]; then
# #       nvm install
# #     elif [ "$nvmrc_node_version" != "$node_version" ]; then
# #       nvm use
# #     fi
# # elif [ "$node_version" != "$(nvm version default)" ]; then
# #     echo "Reverting to nvm default version"
# #     nvm use default
# # fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# # Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

alias ls="ls -t --color=auto "
#
# start a tmux session

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('~/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "~/anaconda3/etc/profile.d/conda.sh" ]; then
        . "~/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="~/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source ~/.fonts/devicons-regular.sh
source ~/.fonts/fontawesome-regular.sh
source ~/.fonts/octicons-regular.sh
source ~/.fonts/pomicons-regular.sh

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
alias heroku='~/node_modules/heroku/bin/run'
# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/data/data/com.termux/files/home/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk
zplugin light oldratlee/hacker-quotes
zplugin light webyneter/docker-aliases
zplugin light dbkaplun/smart-cd

### End of Zinit's installer chunk
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
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
fpath=(~/.zplugin/completions/_zplugin $fpath)
zplugin light "hlissner/zsh-autopair"

zplugin light "bhilburn/powerlevel9k"
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
HEROKU_AC_ZSH_SETUP_PATH=~/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
