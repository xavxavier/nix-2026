{ ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {

      bezier = "linear, 1, 1, 0, 0";
      animation = "fade, 1, 1.8, linear";
      general = { "hide_cursor" = true; };
      "background" = {
        "monitor" = "";
        path = "/home/xavier/.wallpapers/images.jpg";
        blur_passes = 2;
      };
      "label" = [
        {
          monitor = "";
          text = "Hi there, Xavier";
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 25;
          font_family = "Noto Sans Bold";

          position = "0, 80";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "Password Please";
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 25;
          font_family = "Noto Sans";

          position = "0, 30";
          halign = "center";
          valign = "center";
        }

      ];
    };

  };
}
