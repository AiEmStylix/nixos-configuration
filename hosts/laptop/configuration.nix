{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/default.nix
    ../../modules/hyprland.nix
    inputs.stylix.nixosModules.stylix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.stylix = {
      imports = [
        ../../home/stylix/home.nix

      ];
    };
    useGlobalPkgs = true;
    backupFileExtension = "backup";
  };

  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    polarity = "dark";
    homeManagerIntegration.autoImport = true;
  };

  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
      "https://walker.cachix.org"
      "https://walker-git.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
      "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
    ];
  };

  nix.gc = {
    # Auto weekly garbage collection
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  programs.firefox.enable = true;
  programs.xfconf.enable = true;

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true;
  services.udisks2.enable = true;
  # Fonts packages

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  security.pam.services.hyprlock = { };

  services.openssh.enable = true;

  # Mariadb

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.05"; # Did you read the comment?

}
