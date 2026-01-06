{ config, pkgs, ... }:
{
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";
      "monitor" = "Virtual-1, 2560x1440@165, 0x0, 1.33333333334";
      bind = [
        "$mod, F, exec, firefox"
        "$mod, Return, exec, foot"
        "$mod, Q, killactive"
        "$mod, V, togglefloating"
        "$mod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        )
      );
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
    };
  };

  home.packages = with pkgs; [
    xeyes
  ];
}
