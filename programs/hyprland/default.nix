{ pkgs, ... }:
let
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  # wofi = "${pkgs.wofi}/bin/wofi";
in {
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hyprsunset.nix
    ./packages.nix
    ./waybar.nix
    ./wl-config.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    xwayland.enable = true;

    settings = {
      "exec-once" = [
        "hyprpaper"
        "dunst"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "hypridle"
        "dbus-update-activation-environment --systemd HYPRLAND_INSTANCE_SIGNATURE"
        "systemctl --user start hyprpolkitagent"
        "waybar"
      ];

      "monitor" = ",preferred,auto,1.33334";
      "$mod" = "SUPER";
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        vfr = true;
        vrr = 1;
      };
      input = {
        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.2;
        };
      };
      gesture = "3, horizontal, workspace";
      gestures = { "workspace_swipe_touch" = "true"; };
      xwayland = { "force_zero_scaling" = "true"; };

      env = [
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "GTK_THEME,Materia-dark"
        "XCURSOR_SIZE,40"
        "HYPRCURSOR_SIZE,40"
      ];
      bindel = [
        ", XF86AudioRaiseVolume, exec, ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1.0"
        ", XF86AudioLowerVolume, exec, ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%- --limit 1.0"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
        "$mod, XF86MonBrightnessDown, exec, hyprctl hyprsunset temperature 6000"
        "$mod, XF86MonBrightnessUp, exec, hyprctl hyprsunset temperature 1000"
      ];
      bindl = [
        ", XF86AudioMute, exec, ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, ${playerctl} play-pause"
        ", XF86AudioPrev, exec, ${playerctl} previous"
        ", XF86AudioNext, exec, ${playerctl} next"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod, mouse:274, hyprpicker -a"
      ];
      bind = [
        "$mod, P, exec, hyprpicker -a'"
        "$mod, Return, exec, kitty"
        "$mod, Q, killactive"
        "$mod, F, togglefloating"
        "$mod, L, exec, hyprlock"
        "$mod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
        "$mod, Left, movefocus, l"
        "$mod, Right, movefocus, r"
        "$mod, Up, movefocus, u"
        "$mod, Down, movefocus, d"
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, k, movefocus, d"
        # "$mod, Shift, Left, movewindow, l"
        # "$mod, Shift, Right, movewindow, r"
        # "$mod, Shift, Up, movewindow, u"
        # "$mod, Shift, Down, movewindow, d"
        "$mod, Tab, cyclenext"
        "$mod, Tab, bringactivetotop"
        "$mod, Space, exec, wofi --show drun"
        "$mod, C, exec, 'wl-copy < /tmp/myfile.txt'"
        "$mod, V, exec, cliphist list | wofi --dmenu --pre-display-cmd 'echo '%s' | cut -f 2' | cliphist decode | wl-copy"
        "$mod, B, exec, google-chrome-stable"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]) 9));
    };
  };

}
