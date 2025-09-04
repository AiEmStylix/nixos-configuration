{ pkgs, ... }:
{
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "mochaLight";
    gtk.enable = true;

    hyprcursor = {
      enable = true;
    };
  };
}
