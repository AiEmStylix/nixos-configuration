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
              months = "<span color='#ca9ee6'><b>{}</b></span>";
              weekdays = "<span color='#babbf1'><b>{}</b></span>";
              days = "<span color='#c6d0f5'><b>{}</b></span>";
              today = "<span color='#babbf1'><b>{}</b></span>";
            };
          };
        };

        "tray" = {
          icon-size = 12;
          spacing = 10;
        };

        "battery" = {
          states = {
            "good" = 85;
            "warning" = 30;
            "critical" = 15;
          };
          format = "{icon} {capacity}%";
          format-full = "{capacity}% {icon}";
          format-plugged = " {capacity}%";
          format-charging = " {capacity}%";
          format-alt = "{icon} {capacity}%";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          tooltip-format = "{time}";
          cursor = false;
        };
      };
    };
  };
}
