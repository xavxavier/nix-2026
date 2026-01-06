{config, pkgs, ...}:
{
  programs.zsh = {
  	enable = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;
	localVariables = {
		"EDITOR" = "nvim";
	};

	shellAliases = {
    "ls" = "eza";
		"ll" = "eza -l";
		"l" = "eza -la";
		"la" = "eza -la";
		".." = "cd ..";
    "flakeupdate" = "nix flake update --flake /home/xavier/.dotfiles";
		"nixupdate" = "sudo nixos-rebuild switch --flake /home/xavier/.dotfiles/.";
		"homeupdate" = "home-manager switch --flake /home/xavier/.dotfiles/.";
		"vim" = "nvim";
    "cd" = "z";
	};

	oh-my-zsh = {
		enable = true;
		theme = "robbyrussell";
		plugins = [
			"sudo"
			"rust"
			"pip"
			"tailscale"
			"docker"
			"ngrok"
			"git"
		];
			
	};
  };
}
