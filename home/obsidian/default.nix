{config, pkgs, ...}:

{
  programs.obsidian = {
    enable = true;
    vaults = {
      "stylix".enable = true;
    };
  };
}
