# Theme
fish_config theme choose "Dracula Official"

# Disable the original greeting
set -g fish_greeting

set EDITOR nvim
set VISUAL nvim
set SHELL /usr/bin/fish

# Abbrevations
abbr n nvim
abbr v nvim
abbr vi nvim
abbr vim nvim

abbr tree lsd --tree

abbr vpnu "sudo wg-quick up   /etc/wireguard/rhinov-vpn.conf"
abbr vpnd "sudo wg-quick down /etc/wireguard/rhinov-vpn.conf"

# Rust-powered tmux
abbr zn zellij
abbr za zellij a

abbr la lsd -la
abbr ll lsd -l
abbr ls lsd

# Zoxide (cd on steroids)
zoxide init fish | source

# starship Prompt
starship init fish | source
