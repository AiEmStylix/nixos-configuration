{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.users.stylix = {
    isNormalUser = true;
    description = "stylix";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

}
