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
    ./wlogout.nix
    ./rofi.nix
    ./swaync.nix
    ./hyprpaper.nix
    ./hyprcursor.nix
    ./walker.nix
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
    TERMINAL = "alacritty";
  };

  home.packages = with pkgs; [
    qimgv
    obs-studio
    telegram-desktop
    insomnia
    zip
    android-tools
    vesktop
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
    lf
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    file-roller
  ];

  # Allow unfree in nixpkgs
  home.file.".config/nixpkgs/config.nix".text = ''{allowUnfree = true;}'';

  programs.gpg = {
    enable = true;
  };

  programs.hyprshot = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
    pinentry.package = pkgs.pinentry-tty;
  };

  services.swaync.enable = true;

  services.swayosd.enable = true;

  programs.hyprlock.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = lib.mkForce 0.5;
    };
  };

  programs.lazysql.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
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
