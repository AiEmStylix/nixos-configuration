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
      websearch.prefix = "?";
      switcher.prefix = "/";
      terminal = "alacritty";
    };
  };
}
