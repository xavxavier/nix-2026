{ config, pkgs, ... }: {
  imports = [ ../programs ];

  home.packages = with pkgs; [
    # Terminal Emulators
    kitty
    alacritty
    foot

    # Usefull Commands
    neofetch
    bat
    eza
    fzf
    zoxide

    # General Programs
    nodejs_20
    nodePackages.eslint
    nodePackages.typescript
    cargo
    rustc
    unzip
    python3
    nixfmt
    clang
  ];

  home.username = "xavier";
  home.homeDirectory = "/home/xavier";
  programs.git.enable = true;
  wayland.windowManager.hyprland.enable = true; # enable Hyprland

  home.sessionVariables = { EDITOR = "nvim"; };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
