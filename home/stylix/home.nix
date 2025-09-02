{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  home.username = "stylix";
  home.homeDirectory = "/home/stylix";

  home.stateVersion = "25.05";

  imports = [
    ./git.nix
    ./hyprconf.nix
    ./waybar.nix
    ./thunar.nix
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
    TERMINAL = "alacritty";
  };

  home.packages = with pkgs; [
    gnirehtet
    wl-clipboard
    nixd
    tree-sitter
    vscode
    nixfmt-rfc-style
    fzf
    ripgrep
    starship
    gh
    wofi
    hyprpaper
    lf
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    file-roller
  ];

  home.file.".config/nixpkgs/config.nix".text = ''{allowUnfree = true;}'';

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    pinentry.package = pkgs.pinentry-tty;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = lib.mkForce 0.5;
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [
      "git"
      "sudo"
    ];
  };

  xdg.mimeApps.defaultApplications = {
    "inode/directory" = [ "thunar.desktop" ];
  };
}
