{config, pkgs, ...}:

{
  home.username = "stylix";
  home.homeDirectory = "/home/stylix";
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
  }

  home.stateVersion = "25.05";
}