{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    git
    neovim
    wget
    curl
    alacritty
    sbctl
    niv
    wl-clipboard
    nixd
    tree-sitter
    vscode
    nixfmt-rfc-style
  ];

  # Set the default editor to neovim
  environment.variables.EDITOR = "neovim";
}
