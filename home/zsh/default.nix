{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      sail= "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)";
    };
  };
}
