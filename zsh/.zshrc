# zmodload zsh/zprof
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="crcandy"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias g="git"
alias gs="git status --short"
alias t="tmux"
alias ls="eza"
alias cat="bat -pp"
alias v="nvim"

alias z='selected_path=$(zoxide query -l | fzf); \
[ -n "$selected_path" ] && \
win_name=$(basename "$selected_path"); \
win_idx=$(tmux list-windows -F "#{window_index}:#{window_name}" | grep -E "^([0-9]+):$win_name$" | grep -o "^[0-9]\+"); \
if [ -n "$win_idx" ]; then \
  tmux select-window -t "$win_idx"; \
else \
  tmux new-window -c "$selected_path" -n "$win_name"; \
fi'

# optimizely
alias ncd="nc-docker"
alias ncdu="nc-docker up"
alias pal="pyenv activate localdev"

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env --shell zsh)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export COMPOSE_DOCKER_CLI_BUILD=1

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export PATH="/opt/homebrew/bin:$PATH"

_nc_docker_completion() {
    COMPREPLY=( $( env COMP_WORDS="${COMP_WORDS[*]}" \
                COMP_CWORD=$COMP_CWORD \
                _NC_DOCKER_COMPLETE=complete $1 ) )
    return 0
}

complete -F _nc_docker_completion -o default nc-docker

. "$HOME/.local/bin/env"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
# fpath=(/Users/md.shahnewaz.siddique/.docker/completions $fpath)
# autoload -Uz compinit
# compinit
# End of Docker CLI completions

# zprof
#
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-"${HOME}/.cache"}"

#shellcheck shell=sh

if ! test -f "${XDG_CACHE_HOME}/newscred_aws_codeartifact_auth_token" || test -z "$(find "${XDG_CACHE_HOME}/newscred_aws_codeartifact_auth_token" -mmin -$(( 10 * 60 )))"; then
  if ! aws sts get-caller-identity --query "Account" >/dev/null 2>&1; then
    aws sso login
  fi

  AWS_CODEARTIFACT_AUTH_TOKEN="$(aws codeartifact get-authorization-token \
    --duration-seconds "$(( 8 * 60 * 60 ))" \
    --domain "newscred" \
    --domain-owner "304160530156" \
    --query authorizationToken \
    --output text)"

  if test -n "${AWS_CODEARTIFACT_AUTH_TOKEN}"; then
    echo "${AWS_CODEARTIFACT_AUTH_TOKEN}" > "${XDG_CACHE_HOME}/newscred_aws_codeartifact_auth_token"
  fi
fi

export AWS_CODEARTIFACT_AUTH_TOKEN=$(cat "${XDG_CACHE_HOME}/newscred_aws_codeartifact_auth_token")

# nncd
# Completion function for nncd using completions from nc-docker
_nncd_completion() {
    local completions
    completions=$(~/nncd --complete "${words[@]:1}")
    compadd -- $completions
}

# Register the completion function for nncd
compdef _nncd_completion nncd
