#!/bin/bash

# exit immediately if a command exits with a non-zero status
set -e

while getopts ":e:" opt; do
  case $opt in
  e)
    env=$OPTARG
    ;;
  \?)
    echo "Invalid option: -$OPTARG. Set the intended install environment with -e <environment>, where environment is \"work\" or \"personal\"." >&2
    exit 1
    ;;
  esac
done

if [ "$env" != "work" ] && [ "$env" != "personal" ]; then
  echo "Invalid environment given. Valid environments are \"work\" and \"personal\"." >&2
  exit 1
fi

set_up_homebrew() {
  echo 'Installing homebrew...'
  if which brew >/dev/null 2>&1; then
    echo 'Homebrew already installed, skipping...'
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
}

set_up_rcm() {
  echo 'Setting up RCM...'
  if which rcup >/dev/null 2>&1; then
    echo 'RCM already set up, skipping...'
  else
    mkdir -p $HOME/.dotfiles
    cd $HOME/.dotfiles
    brew install rcm # it's also in my brewfiles, but those aren't installed yet
    rcdn
    rcup -x README.md -x install.sh -x brewfiles -v
  fi
}

install_main_bundle() {
  echo 'Installing main brewfile...'
  brew bundle --file $HOME/.dotfiles/brewfiles/main
}

set_up_private_dotfiles() {
  echo 'Setting up private dotfiles...'
  if [ -e "$HOME/.private/zshrc" ]; then
    echo 'Private dotfiles already exist, skipping...'
  else
    mkdir -p $HOME/.private
    touch $HOME/.private/zshrc
  fi
}

set_up_zsh() {
  echo 'Setting up ZSH...'
  if which zsh >/dev/null 2>&1; then
    echo 'ZSH already installed, skipping...'
  else
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sudo chsh -s /usr/bin/zsh echo "$USER"
  fi
}

# Taken from https://github.com/wassimk/dotfiles/blob/596a4b8573408fe96177f5e19f2142e6ef35c81d/dotfiles.sh#L25-L30
set_up_lazygit() {
  echo "Setting up lazygit..."
  real_lazygit_config_dir="$HOME/Library/Application Support/lazygit"
  lazygit_config_file="$HOME/.config/lazygit/config.yml"
  if [ -d "$real_lazygit_config_dir" ]; then
    ln -sf "$lazygit_config_file" "$real_lazygit_config_dir/config.yml"
  fi
}

install_zsh_theme() {
  echo 'Installing ZSH theme (pure)...'
  if [ -d "$HOME/Code/pure" ]; then
    echo 'ZSH theme already installed, skipping...'
  else
    git clone https://github.com/sindresorhus/pure.git $HOME/Code/pure
  fi
}

install_personal_bundle() {
  echo 'Installing personal bundle...'
  /opt/homebrew/bin/brew bundle --file $HOME/.dotfiles/brewfiles/personal
}

install_work_bundle() {
  echo 'Installing work bundle...'
  /opt/homebrew/bin/brew bundle --file $HOME/.dotfiles/brewfiles/work
}

set_up_dev_environment() {
  echo 'Setting up dev environment...'
  . $(brew --prefix asdf)/libexec/asdf.sh
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
  asdf install
  gem install bundler
  npm install
}

set_up_homebrew
set_up_rcm
install_main_bundle
set_up_private_dotfiles
set_up_zsh
set_up_lazygit
install_zsh_theme
set_up_dev_environment

if [ "$env" == "personal" ]; then
  install_personal_bundle
elif [ "$env" == "work" ]; then
  install_work_bundle
fi

echo ''
echo 'Install complete! 🎉'

exit
