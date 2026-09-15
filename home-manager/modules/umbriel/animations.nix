{ config, ... }: let
  shaders = "${config.home.homeDirectory}/nix-config/home-manager/modules/umbriel/shaders";
in
{
	programs.umbriel.settings = {
		animation = {
			enabled = true;
			duration_ms = 50;
			curve = "easeout";
			windows_in = {
				enabled = true;
				duration_ms = 150;
				curve = "easeout";
				style = "popin";
			};
			windows_out = {
				enabled = true;
				duration_ms = 150;
				curve = "easeout";
				style = "slide";
			};
			windows_move = {
				enabled = true;
				duration_ms = 150;
				curve = "snappy";
			};
			workspaces = {
				enabled = true;
				duration_ms = 150;
				curve = "easeout";
			};
			overview = {
				enabled = true;
				duration_ms = 150;
				curve = "easeout";
			};
			scratchpad = {
				enabled = false;
				duration_ms = 150;
				curve = "easeout";
				dim = 0.5;
				blur = false;
				scale = 0.0;
				maximize = false;
				fullscreen = false;
			};
			border = {
				enabled = true;
				duration_ms = 250;
				shader = "${shaders}/border-pulse.glsl";
			};
			dim_unfocused = {
				enabled = false;
				duration_ms = 250;
				curve = "easeout";
				dim = 0.0;
			};
			layers = {
				enabled = false;
				duration_ms = 250;
				curve = "easeout";
			};
		};
	};
}