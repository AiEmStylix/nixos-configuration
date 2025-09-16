{ pkgs, config, ... }:

let
  terminal = "alacritty";
  menu = "wofi --show drun";
  mod = "SUPER";
in
{
  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {

    monitor = [ ",prefered,auto,1" ]
    ;

    exec-once = [ "${terminal}" ];
    input = {
      touchpad.natural_scroll = true;
    };
    bind = [
      "${mod}, Q, exec, ${terminal}"
      "${mod}, F, exec, firefox"
      "${mod}, C, killactive"
      "${mod}, M, exit"
      "${mod}, R, exec, ${menu}"

      # Move focus with mod + hjkl (vim keys)
      "${mod}, H, movefocus, l"
      "${mod}, L, movefocus, r"
      "${mod}, K, movefocus, u"
      "${mod}, J, movefocus, d"

      # Cycle between tab
      "ALT, tab, cyclenext"
    ]
    ++ (builtins.concatLists (
      builtins.genList (
        i:
        let
          ws = i + 1;
        in
        [
          "${mod}, ${toString i}, workspace, ${toString i}"
          "${mod} SHIFT, ${toString i}, movetoworkspace, ${toString i}"
        ]
      ) 9
    ));

    bindm = [
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 10;

      border_size = 2;

      resize_on_border = false;

      allow_tearing = false;

      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      rounding_power = 2;

      active_opacity = 1.0;
      inactive_opacity = 1.0;

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };
    };
  };
}
