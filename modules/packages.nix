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
    wget
    curl
    neovim
    alacritty
    sbctl
    niv
  ];

  # Set the default editor to neovim
  environment.variables.EDITOR = "neovim";
  programs.zsh.enable = true;
}
