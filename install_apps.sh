#!/bin/bash

if [ ! -f "/usr/local/bin/brew" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Cerrar la terminal y ejecutar nuevamente para continuar con la instalacion."
    exit
fi

FORMS=(
    'git'
    'wget'
    'lazygit'
    'neovim'
    'node'
    'gcc'
    'go'
    'rust'
    'rustfmt'
    'yarn'
    'llvm'
    'ripgrep'
    'fd'
    'zsh-autosuggestions'
    'zsh-syntax-highlighting'
    'autojump'
    'fzf'
    'the_silver_searcher'
)
for FORM in "${FORMS[@]}"; do
    brew install "$FORM"
done

CASKS=(
    'firefox'
    'brave-browser'
    'alacritty'
    'iterm2'
    'visual-studio-code'
    'flutter'
    'anaconda'
    'mpv'
    'vlc'
    'idrive'
    'virtualbox'
    'virtualbox-extension-pack'
    'vmware-fusion'
    'affinity-photo'
    'affinity-publisher'
    'affinity-designer'
)
for CASK in "${CASKS[@]}"; do
    brew install --cask "$CASK"
done

# Git
git config --global user.email "gastongmartinez@gmail.com"
git config --global user.name "Gastón Martínez"

# NeoVim
mkdir -p ~/.config/nvim
git clone https://github.com/gastongmartinez/Nvim ~/.config/nvim

# Descargas Varias
cd ~/Desktop || return
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
wget https://redirector.gvt1.com/edgedl/android/studio/install/2020.3.1.25/android-studio-2020.3.1.25-mac.dmg
cd ~ || return

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.local/share/zsh/powerlevel10k
{
    echo 'source ~/.local/share/zsh/powerlevel10k/powerlevel10k.zsh-theme'
    echo 'source /usr/local/share/autojump/autojump.zsh'
    echo 'source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
    echo 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
    echo -e '\n# History in cache directory:'
    echo 'HISTSIZE=10000'
    echo 'SAVEHIST=10000'
    echo 'HISTFILE=~/.cache/zshhistory'
    echo 'setopt appendhistory'
    echo 'setopt sharehistory'
    echo 'setopt incappendhistory'
} >>~/.zshrc