{ config, pkgs, inputs, ... }:

{
  home.username = "stylix";
  home.homeDirectory = "/home/stylix";

  home.stateVersion = "25.05";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    wl-clipboard
    nixd
    tree-sitter
    vscode
    nixfmt-rfc-style
    git
    fzf
    ripgrep
    starship
  ];

  wayland.windowManager.hyprland= {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
  }

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
  };

  programs.starship.enable = true;

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
      "sudo"
    ];
    theme = "";
  };
}
