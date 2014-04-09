# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="squarefrog"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias json_formatter="python -mjson.tool"
alias gs="git status"
alias gaa="git add --all"
alias ls="ls -G"
alias objclean="/Applications/Objective-Clean.app/Contents/Resources/ObjClean.app/Contents/MacOS/ObjClean"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Disable auto correct
DISABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git terminalapp)

source $ZSH/oh-my-zsh.sh
source ~/.rvm/scripts/rvm

# Customize to your needs...
export PATH=$PATH:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/bin:~/AndroidDev/sdk/platform-tools

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
