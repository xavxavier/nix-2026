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
		"nixupdate" = "sudo nixos-rebuild switch --flake ~/.dotfiles/.";
		"homeupdate" = "home-manager switch --flake ~/.dotfiles/.";
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
