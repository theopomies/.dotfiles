{
  description = "@theopomies nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
          # Terminal / CLI / TUI
          pkgs.nushell
          pkgs.evil-helix
          pkgs.zoxide
          pkgs.starship
          pkgs.atuin
          pkgs.lsd
          pkgs.bat
          pkgs.ripgrep
          pkgs.fzf
          pkgs.zellij
          pkgs.yazi
          pkgs.gh
          pkgs.gh-dash
          pkgs.carapace
          # Global Languages
          pkgs.rustup # rust
          pkgs.uv # python
          pkgs.fnm # javascript
          pkgs.zig # zig
          # Global LSPs
          pkgs.basedpyright # python linter
          pkgs.ruff # python formatter
          pkgs.typescript-language-server # typescript of course
          pkgs.zls # zig
          pkgs.taplo # toml
          pkgs.marksman # md
          pkgs.nil # nix
        ];

      # Disable nix-darwin's management of Nix to avoid conflict with Determinate
      nix.enable = false;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Force builds from source by disabling binary caches
      # NOTE: Also needs to be added to /etc/nix/nix.conf because managed by Determinate System's Nix
      nix.settings.substitute = false;

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;

      # Enable direnv
      programs.direnv.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#$(scutil --get LocalHostName)
    darwinConfigurations."Theos-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ configuration ];
    };
  };
}
