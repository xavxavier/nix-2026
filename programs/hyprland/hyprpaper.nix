{ ... }:

{
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    preload = [ "/home/xavier/.wallpapers/images.jpg" ];
    wallpaper = [ "eDP-1,/home/xavier/.wallpapers/images.jpg" ];
  };
}
