{ config, pkgs, ... }:

{
  home.username = "stylix";
  home.homeDirectory = "/home/stylix";
  programs.zsh.enable = true;

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    wl-clipboard
    nixd
    tree-sitter
    vscode
    nixfmt-rfc-style
    git
  ];
}
