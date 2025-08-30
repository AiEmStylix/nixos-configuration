{ pkgs, config, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [ "alacritty" ];
      bind = [
        "SUPER, Q, exec, alacritty"
        "SUPER, F, exec, firefox"
        "SUPER, C, killactive"
      ];
      monitor = [ ",prefered,auto,auto" ];
    };
  };
}
