/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install git fzf
brew install --cask docker google-chrome slack visual-studio-code firefox microsoft-edge spotify zoom

ln -s .zshrc ~/.zshrc

source ~/.zshrc

defaults write "Apple Global Domain" com.apple.mouse.scaling 5
defaults write "Apple Global Domain" com.apple.trackpad.scaling 5

sudo shutdown -r now
