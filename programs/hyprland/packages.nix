{ pkgs, ... }: {
  home.packages = with pkgs; [
    xeyes
    hyprpaper
    dunst
    libnotify
    wofi
    hyprpicker
    wl-clipboard
    cliphist
    iwgtk
    hyprshade
    hyprsunset
    hypridle
    hyprlock
    hyprpolkitagent
  ];
}
