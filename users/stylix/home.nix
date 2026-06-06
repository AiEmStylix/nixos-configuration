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
    ../../home/nixvim
    ../../home/zathura
    ../../home/nh
    ../../home/fcitx5
    ../../home/zsh
    ../../home/nushell
    ../../home/ghostty
    ../../home/starship
    ../../home/gpg
    ../../home/git
    # ../../home/neovim
    ../../home/fuzzel
    ../../home/obsidian
    ../../home/fzf
    ../../home/ripgrep
    ../../home/brave
    # ../../home/zellij
  ];

  # Config dotfiles
  home.file = {
    ".config/niri".source = ../../home/niri;
  };

  home.packages = with pkgs; [
    docker-compose
    usbutils
    aseprite
    vscode
    fastfetch
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
    dbeaver-bin
    jetbrains.clion
    antigravity
    uv

    # Video Editor
    davinci-resolve
    kdePackages.kdenlive

    # Film hosting
    vlc
    qbittorrent

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

    obs-studio
    gimp
    localsend

    go
    openssl
    # Debugger
    lldb
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
  home.stateVersion = "25.05";
}
