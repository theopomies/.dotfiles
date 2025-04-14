use std "path add"

# Nix and nix-darwin
path add "/Users/theopomies/.nix-profile/bin"      # User Nix profile
path add "/nix/var/nix/profiles/default/bin"       # System-wide Nix profile
path add "/run/current-system/sw/bin"              # nix-darwin system packages

# fnm (nvm equivalent)
fnm env --json | from json | load-env
path add $"($env.FNM_MULTISHELL_PATH)/bin"

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

