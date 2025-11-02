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
    ];
    home.packages = with pkgs; [
        fastfetch
        fzf # Fuzzy finder
        
        # Misc
        tree
        file
        scrcpy
        android-tools
    ];

    home.stateVersion = "25.05";
}
