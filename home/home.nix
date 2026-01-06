{config, pkgs, ...}: 
{
  imports = [
    ../programs
  ];

  home.packages = with pkgs; [
    hello
    neofetch
    bat
    kitty
    eza
    fzf
    nodejs_20
    nodePackages.eslint
    nodePackages.typescript
    cargo
    rustc
    unzip
    python3
    zoxide
  ];

  home.username = "xavier";
  home.homeDirectory = "/home/xavier";
  programs.git.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
