{ config, ... }: {
  xdg.configFile."umbriel/shaders".source = ./community-shaders;
	programs.umbriel.settings = {
    include = {
      files = [
        "shaders/accent-pulse/effect.toml"
        "shaders/vhs/effect.toml"
        "shaders/wobbly-move/effect.toml"
        "shaders/vhs-ripple/effect.toml"
      ];
    };
		animation = {
			enabled = true;

			windows_in = {
				enabled = true;
        effect = "vhs";
				duration_ms = 350;
				curve = "linear";
			};
			windows_out = {
				enabled = true;
        effect = "vhs";
				duration_ms = 300;
				curve = "linear";
			};
			windows_move = {
				enabled = true;
        effect = "wobbly-move";
				duration_ms = 300;
				curve = "easeout";
			};
      windows_drag = {
        physics = true;
      };
			workspaces = {
				enabled = true;
        effect = "vhs-ripple";
				duration_ms = 600;
				curve = "easeout";
			};
			overview = {
				enabled = true;
				duration_ms = 250;
				curve = "easeout";
			};
    };
    effects = {
      border = "accent-pulse";
    };
	};
}
