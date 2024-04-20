# If you come from bash you might have to change your $PATH.
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/opt/local/bin/:/Users/theopomies/.cargo/bin:Users/theopomies/.local/share/solana/install/active_release/bin:/Users/theopomies/Library/Python/3.10/bin:/Users/theopomies/Library/Python/3.9/bin:$PATH"
export ZSH="/Users/theopomies/.oh-my-zsh"
export EDITOR=nvim
export VISUAL=nvim
export NVM_DIR="$HOME/.nvm"
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

ZSH_THEME="vercel"
plugins=(
	git
	node
	deno
	rust
	aliases
	brew
	vscode
	docker
	docker-compose
	zsh-autosuggestions
)


alias vim="nvim"
alias john="~/Downloads/john/run/john"
alias cs="cd ~/Desktop/Projets/selflearning"
alias myip="ifconfig -u | grep 'inet ' | grep -v 127.0.0.1 | cut -d\  -f2 | head -1"
alias docker-postgres="docker run --name some-postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=postgres -e POSTGRES_USER=postgres -d -p 5432:5432 postgres"
alias kill-postgres="docker kill some-postgres && docker rm some-postgres"

eval "$(zoxide init zsh)"

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bun completions
[ -s "/Users/theopomies/.bun/_bun" ] && source "/Users/theopomies/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/theopomies/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home"
export ANDROID_HOME=~/Library/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# java end


#eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/theopomies/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/theopomies/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/theopomies/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/theopomies/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

fpath+=~/.zfunc
autoload -Uz compinit && compinit

export MOJO_PYTHON_LIBRARY=/opt/homebrew/anaconda3/lib/libpython3.10.dylib
export MOJO_PYTHON_LIBRARY=/Users/theopomies/miniconda3/lib/libpython3.11.dylib

PATH=~/.console-ninja/.bin:$PATH