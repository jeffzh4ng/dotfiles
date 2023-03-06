#!/bin/sh

xcode-select --install

# install homebrew
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    exit
fi

# then git immediately, since some software is installed via git rather than homebrew
brew install git

# ##############################################################################
# plugs
# ##############################################################################
brew install --cask --no-quarantine brave-browser
brew install --cask --no-quarantine discord
brew install --cask --no-quarantine signal
brew install --cask --no-quarantine spotify

# ##############################################################################
# tools
# ##############################################################################

brew install --cask --no-quarantine karabiner-elements
brew install --cask --no-quarantine alfred
brew install --cask --no-quarantine flux
brew install --cask --no-quarantine little-snitch

# ##############################################################################
# workflow management
# ##############################################################################
# windows
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# | adding yabai config entry to sudoers file
# |
# |
# |
# |
USER=$(whoami)
YABAI_PATH=$(which yabai)
HASH=$(shasum -a 256 "$YABAI_PATH" | awk '{print $1}')

# create the sudoers file and add the configuration entry
echo "creating sudoers file for yabai script addition"
echo "$USER ALL=(root) NOPASSWD: sha256:$HASH $YABAI_PATH --load-sa" | sudo tee /private/etc/sudoers.d/yabai >/dev/null
# |
# |
# |
# |
# | done adding yabai config entry to sudoers file


brew install jq # jq is needed for a specific skhd keymap
brew services start yabai
brew services start skhd

# terminals
brew tap epk/epk # tap for font
brew install --cask font-sf-mono-nerd-font
brew install --cask alacritty
brew install fish
brew install starship
brew install zoxide
brew install fzf

brew install tmux
brew install neovim

# ##############################################################################
# development
# ##############################################################################

# node
install_fisher="curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
fish -c "$install_fisher"
fish -c "fisher install jorgebucaran/nvm.fish"
fish -c "nvm install lts"
# set --universal nvm_default_version lts
brew install pnpm

# ocaml
brew install opam
opam init --bare -a -y
