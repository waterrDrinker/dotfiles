export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  z 
  fzf
)

source $ZSH/oh-my-zsh.sh

# ─── Dotfiles ────────────────────────────────────────────────────────────────
for f in "$HOME/dotfiles/src/shell"/.zshrc_*; do
  [ -f "$f" ] && source "$f"
done

# ─── Aliases ─────────────────────────────────────────────────────────────────
alias opfls='~/.locale/bin/open_folders.sh'

eval "$(starship init zsh)"
