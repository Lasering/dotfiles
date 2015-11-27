# Path to your oh-my-zsh installation.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
if [ $USER = "simao" ]; then
    ZSH_THEME="simon"
else
    ZSH_THEME="simon-root"
fi

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git scala sbt svn systemd)

source $ZSH/oh-my-zsh.sh

tabs 4
export TERM='xterm-256color'
export EDITOR='vim'

#KEYS BINDINGS
bindkey '^[[H'      beginning-of-line       #Home
bindkey '^[[F'      end-of-line             #End
bindkey '^[[2~'     overwrite-mode          #Insert
bindkey '^[[3~'     delete-char             #Delete
bindkey '^[[3;5~'   kill-word               #Ctrl+Delete
bindkey '^[[33~'    backward-kill-word      #Ctrl+Backspace
bindkey '^[[1;5D'   backward-word           #Ctrl+Left Arrow
bindkey '^[[1;5C'   forward-word            #Ctrl+Right Arrow

#ALIASES
alias t='tree -C'
alias grep='grep --color=always'
alias l='ls -lh --time-style=long-iso --color=always'
alias la='l -A'
alias lx='l --sort=extension' # aka l -X
alias lt='l --sort=time -r' # aka l -t  -r = reverse order while sorting

alias hd='hexdump -C'

if [ $USER = "root" ]; then
	alias vim='vim -u ~simon/.vimrc'
	alias vimdiff='vimdiff -u ~simon/.vimrc'
fi
