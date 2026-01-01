{config, pkgs, ...}:

{
	wayland.windowManager.sway = {
		enable = true; wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
		config = rec {
			modifier = "Mod4";
			# Use kitty as default terminal
			terminal = "foot"; 
			startup = [
				# Launch Firefox on start
				{command = "foot";}
			];
		};
		extraConfig = ''
output Virtual-1 mode 2560x1600@165hz
		'';
	};

 
}
