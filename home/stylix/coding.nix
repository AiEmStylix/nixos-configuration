{config, lib, pkgs ...}:

{
  home.packages = with pkgs; [
    gcc
    sdl3
    rustc
    cargo
  ]
}