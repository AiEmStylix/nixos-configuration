{ pkgs, ... }:

{
  # Thunar config
  home.file."~/.config/xfce4/helpers.rc".text = ''
    	TerminalEmulator = alacritty
  '';
}
