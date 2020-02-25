#!/usr/bin/env sh

# Zsh dotfiles
echo 'Zsh dotfiles...'
cp ./zsh/.zshrc ~/
cp -r ./zsh/.zsh/ ~/
zsh ./zsh/zplugin_install.sh

# Vim dotfiles
echo 'Vim/Neovim dotfiles...'
cp -r ./vim/nvim/ ~/.config/
if [[ -n ~/.vim/ ]];then
    mkdir ~/.vim/
fi
cp -r ./vim/.vimrc ~/
cp -r ./vim/after ~/.vim/
cp -r ./vim/autoload ~/.vim/
cp -r ./vim/snippets ~/.vim/


# Tmux dotfiles
echo  'Tmux dotfiles...'
cp ./tmux/.tmux.conf* ~/
cp -r ./tmux/.tmux ~/

# vifm dotfiles
echo 'vifm dotfiles...'
cp -r ./vifm/ ~/.config/

# Emacs dotfiles
echo 'Emacs dotfiles...'
cp  ./emacs/.emacs ~/

# Powerlevel9k
cp -r ./powerlevel9k ~/
