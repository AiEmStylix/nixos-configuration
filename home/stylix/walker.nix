{
  config,
  pkgs,
  inputs,
  ...
}:

{
  services.walker = {
    enable = true;
    systemd.enable = true;
    settings = {
      search.placeholder = "Search...";
      ui.fullscreen = true;
      websearch.prefix = "@";
      switcher.prefix = "/";
      terminal = "alacritty";
      clipboard = {
        always_put_new_on_top = true;
        avoid_line_breaks = true;
        exec = "wl-copy";
        image_height = 200;
        max_entries = 10;
        name = "clipboard";
        placeholder = "Clipboard";
        prefix = ":";
        weight = 5;
      };
    };
  };
}
