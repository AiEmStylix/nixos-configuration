{ pkgs, ... }:
{
  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.latteLavender;
    name = "latteLavender";
    gtk.enable = true;

    hyprcursor = {
      enable = true;
    };
  };
}
