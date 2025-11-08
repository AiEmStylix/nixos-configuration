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
    ../../home/waybar
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
    chromium
    
    # Misc
    qemu # Virtual machine
    bluetui
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

    #IDE
    jetbrains.phpstorm
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
  ];
    
  programs.noctalia-shell = {
    enable = true;
    };
  
  home.stateVersion = "25.05";
}
