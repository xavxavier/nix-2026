{
  description = "A very basic flake";

  inputs = {
  	nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  	home-manager = {
  		url="github:nix-community/home-manager/release-25.11";
  		inputs.nixpkgs.follows = "nixpkgs";
	};
	nvim-src = {
		url="github:xavxavier/nvim-config-2026";
		flake=false;
	};
  };
  outputs = { self, nixpkgs, home-manager, ...}@inputs: 
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
				extraSpecialArgs = { inherit inputs; }; 

			};
		};
    packages.gillsans = pkgs.stdenvNoCC.mkDerivation {
          name = "gillsans-font";
          dontConfigue = true;
          src = pkgs.fetchzip {
            url =
              "https://freefontsvault.s3.amazonaws.com/2020/02/Gill-Sans-Font-Family.zip";
            sha256 = "sha256-YcZUKzRskiqmEqVcbK/XL6ypsNMbY49qJYFG3yZVF78=";
            stripRoot = false;
          };
          installPhase = ''
            mkdir -p $out/share/fonts
            cp -R $src $out/share/fonts/opentype/
          '';
          meta = { description = "A Gill Sans Font Family derivation."; };
        };

	};

  }
