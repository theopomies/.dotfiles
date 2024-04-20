# Theme
fish_config theme choose Dracula

set EDITOR nvim
set VISUAL nvim
set SHELL /opt/homebrew/bin/fish

# Abbrevations
abbr v nvim
abbr vi nvim
abbr vim nvim

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
