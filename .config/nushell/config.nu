use themes/theopoimandres.nu
use std "path add"

# Nix and nix-darwin
path add "/Users/theopomies/.nix-profile/bin"      # User Nix profile
path add "/nix/var/nix/profiles/default/bin"       # System-wide Nix profile
path add "/run/current-system/sw/bin"              # nix-darwin system packages

# fnm (nvm equivalent)
fnm env --json | from json | load-env
path add $"($env.FNM_MULTISHELL_PATH)/bin"

$env.config.show_banner = false
$env.EDITOR = "hx"
$env.SHELL = "nu"

$env.LS_COLORS = [
  # Files (normal white)
  '*=38;2;255;255;255',                       # white (#FFFFFF, palette 15)
  # Symlinks (italic turquoise)
  'ln=3;38;2;93;228;199',                     # italic, turquoise (#5DE4C7, palette 2/11)
  # Directories (bold light blue)
  'di=1;38;2;137;221;255',                    # bold, light blue (#89DDFF, palette 4)
  # Executables (underline yellow)
  'ex=4;38;2;255;250;194',                    # underline, yellow (#FFFAC2, palette 3/12)
  # Block devices (white on light blue)
  'bd=38;2;255;255;255;48;2;137;221;255',     # white on light blue (#89DDFF, palette 4)
  # Char devices (underline light blue)
  'cd=4;38;2;137;221;255',                    # underline, light blue (#89DDFF, palette 4)
  # Pipes (dim turquoise)
  'pi=2;38;2;93;228;199',                     # faint, turquoise (#5DE4C7)
  # Sockets (bold light blue)
  'so=1;38;2;137;221;255',                    # bold, light blue (#89DDFF)
  # Orphans (blinking purple)
  'or=5;38;2;208;103;157',                    # blink, purple (#D0679D)
  # Missing symlink targets (white on pink)
  'mi=38;2;255;255;255;48;2;240;135;189',     # white on pink (#f087bd, palette 5)
] | str join ":"

$env.config = {
  edit_mode: vi
  cursor_shape: {
    vi_insert: line
    vi_normal: block
  }
  highlight_resolved_externals: true
  color_config: $theopoimandres_theme # <-- this is the theme
  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
      if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
        $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
      }
    }]
  }
}
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = ""

alias la = lsd -la
alias nrs = darwin-rebuild switch --flake ~/.config/nix
alias hnix = hx ~/.config/nix/flake.nix

# Starship (Prompt)
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Zoxide (Better CD)
zoxide init nushell | save -f ~/.zoxide.nu
source ~/.zoxide.nu

# Atuin (Better history)
source ~/.local/share/atuin/init.nu
