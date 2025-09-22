{ pkgs, config, ... }:

let
  terminal = "alacritty";
  menu = "walker";
  mod = "SUPER";
in
{
  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {

    monitor = [ ",prefered,auto,1" ];

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
      "${mod}, ., exec, ${menu} -m symbols"

      # Move focus with mod + hjkl (vim keys)
      "${mod}, H, movefocus, l"
      "${mod}, L, movefocus, r"
      "${mod}, K, movefocus, u"
      "${mod}, J, movefocus, d"

      # Cycle between tab
      "ALT, tab, cyclenext"

      # Screenshot
      "${mod}, PRINT, exec, hyprshot -m window"
      ", PRINT, exec, hyprshot -m output"
      "SHIFT|${mod},PRINT, exec, hyprshot -m region"

      # CapsLock indicator

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

    bindr = [
    ];

    bindel = [
      # --- Volume ---
      # Raise volume (5%)
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && swayosd-client --output-volume raise"
      # Lower volume (5%)
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && swayosd-client --output-volume lower"
      # Toggle mute
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && swayosd-client --output-volume mute-toggle"
      # Toggle mic mute
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && swayosd-client --input-volume mute-toggle"

      # --- Brightness ---
      # Raise brightness (5%)
      ",XF86MonBrightnessUp, exec, brightnessctl set 5%+ && swayosd-client --brightness raise"
      # Lower brightness (5%)
      ",XF86MonBrightnessDown, exec, brightnessctl set 5%- && swayosd-client --brightness lower"
      ",CAPS_LOCK, exec, swayosd-client --caps-lock-led input0::capslock"

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
