{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager,... }: {
    
    nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
                ./hosts/laptop

                home-manager.nixosModules.home-manager 
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;

                    home-manager.users.stylix = import ./users/stylix/home.nix;
                }
            ];
        };
    };
  };
}
