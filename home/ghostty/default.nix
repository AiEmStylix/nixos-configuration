{ config, pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      window-width = 110;
      window-height = 30;
    };
  };
}
