#!/usr/bin/env bash

###
# some bash library helpers
# @author Adam Eivy
###

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

function ok() {
    echo -e "$COL_GREEN[ok]$COL_RESET "$1
}

function bot() {
    echo -e "\n$COL_GREEN\[._.]/$COL_RESET - "$1
}

function running() {
    echo -en "$COL_YELLOW ⇒ $COL_RESET"$1": "
}

function action() {
    echo -e "\n$COL_YELLOW[action]:$COL_RESET\n ⇒ $1..."
}

function warn() {
    echo -e "$COL_YELLOW[warning]$COL_RESET "$1
}

function error() {
    echo -e "$COL_RED[error]$COL_RESET "$1
}

function puts() {
    echo -en "\t$1\t"
}

function require_cask() {
    running "brew cask $1"
    brew cask list $1 > /dev/null 2>&1 | true
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        action "brew cask install $1 $2"
        brew cask install $1
        if [[ $? != 0 ]]; then
            error "failed to install $1! aborting..."
            exit -1
        fi
    fi
    ok
}

function require_brew() {
    running "brew $1"
    brew list $1 > /dev/null 2>&1 | true
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        action "brew install $1"
        brew install $1
        if [[ $? != 0 ]]; then
            error "failed to install $1! aborting..."
            exit -1
        fi
    fi
    ok
}

function require_gem() {
    running "gem $1"
    if [[ $(gem list --local | grep $1 | head -1 | cut -d' ' -f1) != $1 ]]; then
      puts "installing"
      gem install $1
    fi
    ok
}

function symlinkifne {
    running "$1"

    if [[ -e $1 ]]; then
        # file exists
        if [[ -L $1 ]]; then
            # it's already a simlink (could have come from this project)
            puts "exists, skipping";ok
            return
        fi
        # backup file does not exist yet
        if [[ ! -e ~/.dotfiles_backup/$1 ]];then
            mv $1 ~/.dotfiles_backup/
            puts 'backed up saved...';
        fi
    fi
    # create the link
    ln -s $DOTFILES/$1 $1
    puts "linked";ok
}

function linkpreztofile {
  running "$1"

  if [[ -e ".$1" ]]; then
        # file exists
        if [[ -L ".$1" ]]; then
            # it's already a simlink (could have come from this project)
            puts "exists, skipping";ok
            return
        fi
        # backup file does not exist yet
        if [[ ! -e ~/.dotfiles_backup/$1 ]];then
            mv ".$1" ~/.dotfiles_backup/
            puts 'backed up saved...';
        fi
    fi
    # create the link
    ln -s $DOTFILES/prezto/runcoms/$1 ".$1"
    puts 'linked';ok
}

function linkpreztofolder {
  running "zprezto"

  if [[ -e .zprezto ]]; then
        # file exists
        if [[ -L .zprezto ]]; then
            # it's already a simlink (could have come from this project)
            puts 'exists, skipping';ok
            return
        fi
        # backup file does not exist yet
        if [[ ! -e ~/.dotfiles_backup/$1 ]];then
            mv ".zprezto" ~/.dotfiles_backup/
            puts 'backed up saved...';
        fi
    fi
    # create the link
    ln -s $DOTFILES/prezto .zprezto
    puts 'linked';ok
}

function installfont {
  running "$1"
  FONTS_DIR="$HOME/Library/Fonts"
  FONT_LOC="$FONTS_DIR/$1"
  if [[ ! -e $FONT_LOC ]]; then
    puts "installing"
    if [[ ! -d "$FONTS_DIR" ]]; then
      mkdir -p $FONTS_DIR
    fi
    ln -s $DOTFILES/fonts/$1 $FONT_LOC
  fi
  ok
}
