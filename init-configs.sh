#!/bin/bash

mkdir -p ~/.config/{nvim,coc}

cp ./init.vim ~/.config/nvim/init.vim
cp ./coc-settings.json ~/.config/nvim/coc-settings.json
cp ./.zshrc ~/.zshrc
cp ./.tmux.conf ~/.tmux.conf
