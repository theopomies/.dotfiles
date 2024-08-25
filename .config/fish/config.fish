# Theme
fish_config theme choose "Dracula Official"

# Disable the original greeting
set -g fish_greeting

set EDITOR nvim
set VISUAL nvim
set SHELL /opt/homebrew/bin/fish

fish_add_path "/Users/theopomies/.bun/bin"

# Abbrevations
abbr n nvim
abbr v nvim
abbr vi nvim
abbr vim nvim

alias myls /Users/theopomies/projects/rust/lsd/target/release/lsd
alias mytree "/Users/theopomies/projects/rust/lsd/target/release/lsd --tree"

abbr vpnu "sudo wg-quick up   /etc/wireguard/rhinov-vpn.conf"
abbr vpnd "sudo wg-quick down /etc/wireguard/rhinov-vpn.conf"

# Rust-powered tmux
abbr zn zellij
abbr za zellij a

abbr la lsd -la
abbr ll lsd -l
abbr ls lsd
abbr tree lsd --tree

# Zoxide (cd on steroids)
zoxide init fish | source

# starship Prompt
starship init fish | source

# Set up fzf key bindings
fzf --fish | source
