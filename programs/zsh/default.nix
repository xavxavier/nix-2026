{ config, pkgs, ... }:

let dotfiles = "${config.home.homeDirectory}/.dotfiles";
in {
  programs.zoxide = { enable = true; };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    localVariables = { "EDITOR" = "nvim"; };

    shellAliases = {
      "ls" = "eza";
      "ll" = "eza -l";
      "l" = "eza -la";
      "la" = "eza -la";
      ".." = "cd ..";
      "flakeupdate" = "nix flake update --flake ${dotfiles}";
      "nixupdate" = "sudo nixos-rebuild switch --flake ${dotfiles}";
      "homeupdate" = "home-manager switch --flake ${dotfiles}";
      "vim" = "nvim";
      "cd" = "z";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "sudo" "rust" "pip" "tailscale" "docker" "ngrok" "git" ];

    };
  };
}
