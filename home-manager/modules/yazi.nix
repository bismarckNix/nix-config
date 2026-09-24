{ pkgs, ... }: {
	programs.yazi = {
		enable = true;
		enableZshIntegration = true;
		shellWrapperName = "y";

		settings = {
			preview = {
				max_width = 1000;
				max_height = 1000;
			};
		};

    plugins = with pkgs.yaziPlugins; {
      inherit lazygit;
      inherit chmod;
      inherit smart-enter;
      inherit sudo;
      inherit ouch;
      inherit mount;
      inherit toggle-pane;
      inherit recycle-bin;
      inherit compress;
      inherit bookmarks;
      full-border = {
        package = full-border;
        setup = true;
      };
      starship = {
        package = starship;
        setup = true;
      };
    };

		keymap = {
			mgr.prepend_keymap = [
				{
					on = "T";
					run = "plugin toggle-pane max-preview";
					desc = "Maximize or restore the preview pane";
				}
				{
					on = "c";
					run = "plugin chmod";
					desc = "Chmod on selected files";
				}
        {
          on = "m";
          run = "plugin bookmarks save";
          desc = "Save current position as a bookmark";
        }
        {
          on = "'";
          run = "plugin bookmarks jump";
          desc = "Jump to a bookmark";
        }
			];
		};
	};
}

