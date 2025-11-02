{config, pkgs, ...}:
{
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = builtins.fromTOML (builtins.readFile ./starship.toml);
    };
    
    # Config nerd fonts for starship
    home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
    ];
    fonts.fontconfig.enable = true;
}
