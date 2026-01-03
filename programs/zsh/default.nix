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
		"nixupdate" = "nix flake update --flake /home/xavier/.dotfiles && sudo nixos-rebuild switch --flake /home/xavier/.dotfiles/.";
		"homeupdate" = "nix flake update --flake /home/xavier/.dotfiles && home-manager switch --flake /home/xavier/.dotfiles/.";
		"vim" = "nvim";
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
