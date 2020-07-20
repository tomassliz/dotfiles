setopt autocd

# Set GEM_HOME to the local user
export GEM_HOME=$HOME/.gem

# Set GOPATH
export GOPATH=$HOME/Developer/go

# If you come from bash you might have to change your $PATH.
export PATH=$GEM_HOME/bin:$GOPATH/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Aliases
alias online="cd ~/Developer/Cleverlance/skoda-auto/connect-sdk-onlinecar-sdk-ios && open OnlineCar.xcodeproj && gfa && gst"
alias garage="cd ~/Developer/Cleverlance/skoda-auto/connect-garage-ios && open Garage.xcodeproj && gfa && gst"

alias lsa="ls -al"

alias gst="git status"
alias gfa="git fetch --all"
alias gco="git checkout"

alias tmux="tmux -f ~/.config/tmux/.tmux.conf"

export LC_ALL=en_US.UTF-8

fpath+=${ZDOTDIR:-~}/.zsh_functions

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' use-cache yes

export EDITOR='vim'

autoload -U compinit
compinit

autoload -U colors && colors

# Disable unused vcs systems
zstyle ':vcs_info:*' disable bzr cdv cvs darcs fossil hg mtn p4 svk svn tla

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on %F{cyan}%b%f'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%{$fg_bold[green]%}%2~%{$reset_color%} ${vcs_info_msg_0_}
> '

# Search history for existing entry
# Takes the cursor to the end of the line after moving in the history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Enable Vim mode in ZSH
bindkey -v

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line                   # Opens Vim to edit current command line
bindkey '^R' history-incremental-search-backward # Perform backward search in command line history
bindkey '^S' history-incremental-search-forward  # Perform forward search in command line history
bindkey '^P' history-search-backward             # Go back/search in history (autocomplete)
bindkey '^N' history-search-forward              # Go forward/search in history (autocomplete)

# Enable Nord color theme for all sessions
export CLICOLOR=1
