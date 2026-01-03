{inputs, config, pkgs, ...}:

{
  xdg.configFile."nvim" = {
  	source = inputs.nvim-src.outPath;
	recursive = true;
  };
}
