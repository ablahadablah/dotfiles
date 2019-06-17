#!/bin/sh

if [ -f ~/.zshrc ]; then
    rm ~/.zshrc
fi

ln -s $(pwd)/zsh/.zshrc ~/.zshrc
source ~/.zshrc
