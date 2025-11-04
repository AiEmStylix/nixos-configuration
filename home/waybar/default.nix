{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-left = [
          "niri/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "tray"
          "bluetooth"
          "network"
          "pulseaudio"
          "battery"
        ];

        "clock" = {
          format = "{:%A %d/%m/%Y - %H:%M}";
          tooltip-format = "<span font_family='monospace'>{calendar}</span>"; # Use span with monospace for teletype text
          calendar = {
            mode = "month";
            format = {
              months = "<span><b>{}</b></span>";
              weekdays = "<span><b>{}</b></span>";
              days = "<span><b>{}</b></span>";
              today = "<span><b>{}</b></span>";
            };
          };
        };
      };
    };
  };
}
