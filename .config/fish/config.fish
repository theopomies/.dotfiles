# Theme
fish_config theme choose theopoimandres

# Disable the original greeting
set -g fish_greeting

set EDITOR /opt/homebrew/bin/nvim
set VISUAL /opt/homebrew/bin/nvim
set SHELL /opt/homebrew/bin/fish

set DENO_INSTALL /Users/theopomies/.deno
fish_add_path "$DENO_INSTALL/bin"
fish_add_path "/Users/theopomies/.bun/bin"

# Abbrevations
abbr n nvim
abbr v nvim
abbr vi nvim
abbr vim nvim

alias myls /Users/theopomies/projects/rust/lsd/target/release/lsd
alias mytree "/Users/theopomies/projects/rust/lsd/target/release/lsd --tree"

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
