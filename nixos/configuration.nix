# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.i3.enable = true;
  };

  services.displayManager ={
    defaultSession = "none+i3";
  };
  services.printing.enable = true;

  # services.pulseaudio.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  users.users.xavier = {
	  isNormalUser = true;
	  extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
	  shell = pkgs.zsh;
	  packages = with pkgs; [
		  tree
	  ];
  };

  environment.systemPackages = with pkgs; [
    vim 
    wget
    neovim
    git
    killall
    kitty
    firefox
    dmenu
    i3status
    alacritty
    zsh
    hyprland
    
  ];

  programs.zsh.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  networking.firewall.enable = false;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11"; 
}

