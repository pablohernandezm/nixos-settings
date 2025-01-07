{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url="github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nvf, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    mkSystem = pkgs : system : hostname : 
      pkgs.lib.nixosSystem {
        system = system;
	modules = [
	  {networking.hostName = hostname;}
	  ./configuration.nix
	  ./hosts/${hostname}/hardware-configuration.nix
	  ./modules/defaults

	  nvf.nixosModules.default

	  home-manager.nixosModules.home-manager
	  {
	    home-manager = {
	      useUserPackages = true;
	      useGlobalPkgs = true;
	      extraSpecialArgs = { inherit inputs; };

	      users.pabloh = ./hosts/${hostname}/user.nix;
	      users.root = ./hosts/${hostname}/user.nix;
	    };
	  }
	];

	specialArgs = { inherit inputs; };
      };
  in
  {
    nixosConfigurations = {
      desktop = mkSystem inputs.nixpkgs system "desktop";
    };

  };
}
