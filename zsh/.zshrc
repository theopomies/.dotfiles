# If you come from bash you might have to change your $PATH.
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/opt/local/bin/:/Users/theopomies/.cargo/bin:$PATH"
export ZSH="/Users/theopomies/.oh-my-zsh"
export EDITOR=nvim
export VISUAL=nvim
export NVM_DIR="$HOME/.nvm"
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
