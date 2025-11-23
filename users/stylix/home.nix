{ config, pkgs, inputs, ... }:

{
  home.username = "stylix";
  home.homeDirectory = "/home/stylix";

  # Import home-manager module
  imports = [
    inputs.noctalia.homeModules.default # Noctalia shell
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

  stylix.targets.neovim.enable = false;

  home.packages = with pkgs; [
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
    nixfmt-rfc-style #Nix Formatter
    btop
    tree
    file
    scrcpy
    gnirehtet
    android-tools
    gcc #C compiler
    cargo
    xwayland-satellite
    libreoffice
    android-tools
    jdk
    nodejs
    teamviewer
    gemini-cli
    pnpm

    #IDE
    jetbrains.phpstorm
    jetbrains.rust-rover
    jetbrains.datagrip
    (php.buildEnv {
      extensions = ({enabled, all}: enabled ++ (with all; [
        xdebug
      ]));
      extraConfig = ''
        xdebug.mode=debug
      '';
    })

    #LSP and formatter
    lua-language-server
    rust-analyzer
    rustfmt
    phpactor

    #Api client
    postman
    yaak
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
