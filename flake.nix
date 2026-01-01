{
  description = "A very basic flake";

  inputs = {
  	nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  	home-manager = {
  		url="github:nix-community/home-manager/release-25.11";
  		inputs.nixpkgs.follows = "nixpkgs";
	};
  };
  outputs = { self, nixpkgs, home-manager, ...}: 
	let
  		system = "x86_64-linux";
  		pkgs = import nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};
		lib = nixpkgs.lib;
	in {
		nixosConfigurations = {
			nixos  = lib.nixosSystem {
				inherit system;
				modules = [ ./nixos/configuration.nix ];
			};
		};
		homeConfigurations = {
			xavier = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home/home.nix ];

			};
		};

	};

  }
