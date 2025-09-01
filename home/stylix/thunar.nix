{ pkgs, ... }:

{
  # Set default terminal emulator to alacritty
  xdg.configFile."xfce4/helpers.rc".text = ''
    TerminalEmulator = alacritty
    TerminalEmulatorDismissed = true
  '';
}
