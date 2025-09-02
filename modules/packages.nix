{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    wget
    curl
    neovim
    sbctl
    niv
    home-manager
  ];

  # Set the default editor to neovim
  environment.variables = {
    EDITOR = "neovim";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
  environment.variables.BROWSER = "firefox";
}
