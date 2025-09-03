{ config, ... }:

let
  wallpaper = builtins.toString ./Wallpaper/1.jpg;
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        wallpaper
      ];

      wallpaper = [
        "eDP-1,${wallpaper}"
      ];
    };
  };
}
