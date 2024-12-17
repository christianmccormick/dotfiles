# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME=""
plugins=()
source $ZSH/oh-my-zsh.sh

# set up homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# aliases
source "$HOME/.zsh/aliases"

# functions
source "$HOME/.zsh/functions"

# private (machine specific) configuration
source "$HOME/.private/zshrc"

# turn on vim bindings
bindkey -v

# set default editor
export EDITOR=nvim

# configure zsh prompt
fpath+=$HOME/Code/pure
autoload -U promptinit; promptinit
prompt pure

# configure ripgrep config file
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# configure autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# set tab titles to current directory
precmd() { echo -ne '\e]1;$PWD\a' }

# set up direnv
eval "$(direnv hook zsh)"

# load adsf
source "$(brew --prefix asdf)/libexec/asdf.sh"
