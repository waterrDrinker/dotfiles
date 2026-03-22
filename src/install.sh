#!/bin/sh

# Install Oh My Zsh (unattended so script continues)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install Starship
if [ "$(uname)" = "Darwin" ]; then
    brew install starship
elif [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        fedora)
            dnf copr enable atim/starship
            dnf install -y starship
            ;;
    esac
fi

# Add Starship to .zshrc if not already there
grep -q "starship init zsh" ~/.zshrc || echo 'eval "$(starship init zsh)"' >> ~/.zshrc
