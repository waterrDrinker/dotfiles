export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm use default >/dev/null

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  z 
  fzf
)

source $ZSH/oh-my-zsh.sh

# ─── Dotfiles ────────────────────────────────────────────────────────────────
# Load generic modules
for f in "$HOME/dotfiles/src/shell/modules"/.zsh_*(.N); do
  source "$f"
done

# Load distro-specific config
if [[ -f /etc/os-release ]]; then
  . /etc/os-release

  distro_file="$HOME/dotfiles/src/shell/modules/distro/.zsh_${ID}"

  [[ -f "$distro_file" ]] && source "$distro_file"
fi

eval "$(starship init zsh)"
