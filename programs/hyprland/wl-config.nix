{ pkgs, lib, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark";
      package = pkgs.materia-theme;
    };
  };

  xdg.portal.enable = lib.mkForce true;
  xdg.portal.config.common.default = "xdg-desktop-portal-hyprland";
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

}
