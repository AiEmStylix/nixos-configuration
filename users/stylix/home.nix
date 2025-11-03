{config, pkgs, ...}: 

{
    home.username = "stylix";
    home.homeDirectory = "/home/stylix";
    
    # Import home-manager module
    imports = [
        ../../home/fcitx5
        ../../home/zsh
        ../../home/ghostty
        ../../home/starship
        ../../home/gpg
        ../../home/git
        ../../home/neovim
	../../home/fuzzel
    ];

    # Config dotfiles
    home.file = {
    ".config/niri".source = ../../home/niri;
    };

    home.packages = with pkgs; [
        fastfetch
        fzf # Fuzzy finder
        curl
        vesktop
        
        # Misc
        btop
        tree
        file
        scrcpy
        gnirehtet
        android-tools
    ];

    home.stateVersion = "25.05";
}
