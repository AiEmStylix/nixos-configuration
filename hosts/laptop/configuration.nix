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
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.stylix = {
      imports = [ ../../home/stylix/home.nix ];
    };
    useGlobalPkgs = true;
  };

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
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
  programs.firefox.enable = true;

  # Fonts packages

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.05"; # Did you read the comment?

}
