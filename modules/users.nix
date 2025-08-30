{ config, pkgs, ... }:

{
  users.users.stylix = {
    isNormalUser = true;
    description = "stylix";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
}
