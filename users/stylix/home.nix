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

    #LSP and formatter
    lua-language-server
    rust-analyzer
    rustfmt
  ];
    
  programs.noctalia-shell = {
    enable = true;
    colors = {
        # you must set ALL of these
      mError = "#dddddd";
      mOnError = "#111111";
      mOnPrimary = "#111111";
      mOnSecondary = "#111111";
      mOnSurface = "#828282";
      mOnSurfaceVariant = "#5d5d5d";
      mOnTertiary = "#111111";
      mOutline = "#3c3c3c";
      mPrimary = "#aaaaaa";
      mSecondary = "#a7a7a7";
      mShadow = "#000000";
      mSurface = "#111111";
      mSurfaceVariant = "#191919";
      mTertiary = "#cccccc";
    };
      # this may also be a string or a path to a JSON file.
  };
  
  home.stateVersion = "25.05";
}
