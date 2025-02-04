# Download Zinit, if it's not there yet
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

export XDG_CONFIG_HOME="$HOME/.config"

# Add in zsh plugins
source $HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.sh
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light dracula/zsh
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# ZSH_THEME="dracula"

# If you come from bash you might have to change your $PATH.
export PATH="/opt/homebrew/opt/openjdk@17/bin:/opt/homebrew/opt/openjdk/bin:/opt/homebrew/bin:/opt/homebrew/sbin:usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/opt/local/bin/:/Users/theopomies/.cargo/bin:Users/theopomies/.local/share/solana/install/active_release/bin:/Users/theopomies/Library/Python/3.10/bin:/Users/theopomies/Library/Python/3.9/bin:$PATH"
export ZSH="/Users/theopomies/.oh-my-zsh"
export EDITOR=nvim
export VISUAL=nvim
export NVM_DIR="$HOME/.nvm"
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"
export DENO_INSTALL="/Users/theopomies/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
export EPICSHOP_EDITOR=cursor

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/theopomies/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home"
export ANDROID_HOME=~/Library/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# java end

export PATH=$PATH:$HOME/.maestro/bin

alias n="nvim"
alias vim="nvim"
alias myip="ifconfig -u | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2 | head -1"
alias mylsd="~/Developer/perso/rust/lsd/target/release/lsd"
alias la="mylsd -la"
alias ls="mylsd"

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"


