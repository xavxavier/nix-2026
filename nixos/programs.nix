{ config, lib, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    zsh
    vim
    wget
    neovim
    git
    lshw
    killall

    hyprland
    firefox
    steam
    gamescope-wsi

    playerctl
    wireplumber
    upower
    brightnessctl
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    dejavu_fonts
    ubuntu-classic
  ];

  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  programs.hyprland.enable = true;

  programs.zsh.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

}
