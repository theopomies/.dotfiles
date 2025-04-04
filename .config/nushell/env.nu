use std "path add"

# path add "/opt/homebrew/bin"

# Nix and nix-darwin
path add "/Users/theopomies/.nix-profile/bin"      # User Nix profile
path add "/nix/var/nix/profiles/default/bin"       # System-wide Nix profile
path add "/run/current-system/sw/bin"              # nix-darwin system packages

$env.EDITOR = "hx"
$env.SHELL = "nu"

zoxide init nushell | save -f ~/.zoxide.nu
