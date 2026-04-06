{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.username = "stylix";
  home.homeDirectory = "/home/stylix";

  # Import home-manager module
  imports = [
    inputs.noctalia.homeModules.default # Noctalia shell
    inputs.catppuccin.homeModules.catppuccin
    ../../home/nh
    ../../home/fcitx5
    ../../home/zsh
    ../../home/ghostty
    ../../home/starship
    ../../home/gpg
    ../../home/git
    ../../home/neovim
    ../../home/fuzzel
    ../../home/obsidian
  ];

  # Config dotfiles
  home.file = {
    ".config/niri".source = ../../home/niri;
  };

  catppuccin = {
    enable = true;
    fcitx5.enable = false;
    cursors.enable = true;
  };

  home.packages = with pkgs; [
    docker-compose
    winboat
    usbutils
    aseprite
    vscode
    fastfetch
    fzf # Fuzzy finder
    curl
    vesktop
    telegram-desktop
    chromium

    # Misc
    qemu # Virtual machine
    lazygit
    brightnessctl
    btop
    tree
    file
    scrcpy
    gnirehtet
    android-tools
    gcc # C compiler
    cargo
    xwayland-satellite
    libreoffice
    android-tools
    jdk
    teamviewer
    gemini-cli
    pnpm
    zed-editor
    qimgv
    rustc

    #IDE
    jetbrains.datagrip
    jetbrains.phpstorm
    dbeaver-bin
    jetbrains.clion
    antigravity
    uv

    # Video Editor
    davinci-resolve
    kdePackages.kdenlive

    #LSP and formatter
    lua-language-server
    rust-analyzer
    rustfmt

    #Api client
    postman
    yaak

    # Run Time
    nodejs
    php
    php84Packages.composer
    laravel
    bun

    obs-studio
    gimp
    inputs.zen-browser.packages.${pkgs.system}.twilight
    google-chrome
    microsoft-edge

    go
  ];

  programs.noctalia-shell = {
    enable = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
  home.stateVersion = "25.05";
}
