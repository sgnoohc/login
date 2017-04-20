#!/bin/bash

# source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc;
fi

function jarvis() {
  source ~/login/.bashrc_mine
}

function setdisplay() {
  echo $DISPLAY > ~/login/.display
}

setdisplay

echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.bash_profile

#eof
