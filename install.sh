#!/bin/bash

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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_main_bundle() {
  echo 'Installing main brewfile...'
  brew bundle --file $HOME/.dotfiles/brewfiles/main
}

set_up_rcm() {
  echo 'Setting up RCM...'
  cd $HOME/.dotfiles
  rcdn
  rcup -x README.md -x Brewfile -x install.sh -x brewfiles
}

set_up_private_dotfiles() {
  mkdir -p $HOME/.private
  touch $HOME/.private/zshrc
}

set_up_zsh() {
  echo 'Setting up ZSH...'
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  sudo chsh -s /usr/bin/zsh echo "$USER"
}

set_up_dev_environment() {
  echo 'Setting up dev environment...'
  rbenv install
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  gem install bundler
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  nvm install --lts
  gem install gem-ctags
  gem ctags
  mkdir -p $HOME/Code
  git clone https://github.com/folke/tokyonight.nvim.git $HOME/Code/tokyonight.nvim
}

# Taken from https://github.com/wassimk/dotfiles/blob/596a4b8573408fe96177f5e19f2142e6ef35c81d/dotfiles.sh#L25-L30
set_up_lazygit() {
  real_lazygit_config_dir="$HOME/Library/Application Support/lazygit"
  lazygit_config_file="$HOME/.config/lazygit/config.yml"
  if [ -d "$real_lazygit_config_dir" ]; then
    ln -sf "$lazygit_config_file" "$real_lazygit_config_dir/config.yml"
  fi
}

install_zsh_theme() {
  echo 'Installing ZSH theme (pure)...'
  git clone https://github.com/sindresorhus/pure.git $HOME/Code/pure
}

install_personal_bundle() {
  echo 'Installing personal bundle...'
  brew bundle --file $HOME/.dotfiles/brewfiles/personal
}

install_work_bundle() {
  echo 'Installing work bundle...'
  brew bundle --file $HOME/.dotfiles/brewfiles/work
}

install_npm_packages() {
  echo 'Installing npm packages...'
  npm install
}

set_up_homebrew
install_main_bundle
set_up_rcm
set_up_private_dotfiles
set_up_zsh
install_vim_plug
set_up_dev_environment
set_up_lazygit
install_zsh_theme
install_npm_packages

if [ "$env" == "personal" ]; then
  install_personal_bundle
elif [ "$env" == "work" ]; then
  install_work_bundle
fi

echo ''
echo 'Install complete! 🎉'

exit
