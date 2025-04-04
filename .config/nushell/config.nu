alias la = lsd -la
alias nrs = darwin-rebuild switch --flake ~/.config/nix
alias hnix = hx ~/.config/nix/flake.nix

# Starship (Prompt)
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Zoxide (Better CD)
source ~/.zoxide.nu

# Atuin (Better history)
source ~/.local/share/atuin/init.nu
