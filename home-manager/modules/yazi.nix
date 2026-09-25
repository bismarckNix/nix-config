{ pkgs, lib, ... }: {
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

    flavors = {
      catppuccin-macchiato = pkgs.fetchFromGitHub {
        owner = "yazi-rs";
        repo = "flavors";
        rev = "main";
        hash = "sha256-NGnfrQdsnQITKCZ0oh6DCxeCR2ozJoPAZetsi3ghHAI";
      } + "/catppuccin-macchiato.yazi";
    };

    theme = {
      flavor = {
        dark = "catppuccin-macchiato";
        light = "catppuccin-macchiato";
      };

      app.overall = { bg = "reset"; };
    };

    plugins = with pkgs.yaziPlugins; {
      inherit lazygit;
      inherit chmod;
      inherit smart-enter;
      inherit sudo;
      inherit mount;
      inherit toggle-pane;
      inherit recycle-bin;
      inherit compress;
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
        # Bookmarks
        {
          on = [ "g" "p" ];
          run = "cd ~/Pictures";
          desc = "Go to ~/Pictures";
        }
        {
          on = [ "g" "n" ];
          run = "cd ~/nix-config";
          desc = "Go to ~/nix-config";
        }

        {
          on = "l";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
				{
					on = "T";
					run = "plugin toggle-pane max-preview";
					desc = "Maximize or restore the preview pane";
				}
				{
					on = [ "c" "m" ];
					run = "plugin chmod";
					desc = "Chmod on selected files";
				}
        {
          on = ["R" "e"];
          run = "shell 'trash-empty' --block --interactive";
          desc = "Empty trash older than N days";
        }
        {
          on = [ "g" "i" ];
          run = "plugin lazygit";
          desc = "Run Lazygit";
        }
        {
          on = "M";
          run = "plugin mount";
        }

        # Compress
        {
          on   = [ "c" "a" "a" ];
          run  = "plugin compress";
          desc = "Archive selected files";
        }
        {
          on   = [ "c" "a" "p" ];
          run  = "plugin compress -p";
          desc = "Archive selected files (password)";
        }
        {
          on   = [ "c" "a" "h" ];
          run  = "plugin compress -ph";
          desc = "Archive selected files (password+header)";
        }
        {
          on   = [ "c" "a" "l" ];
          run  = "plugin compress -l";
          desc = "Archive selected files (compression level)";
        }
        {
          on   = [ "c" "a" "u" ];
          run  = "plugin compress -phl";
          desc = "Archive selected files (password+header+level)";
        }

        # Sudo
        {
          on = [ "R" "S" "p" ];
          run = "plugin sudo -- paste";
          desc = "Sudo paste";
        }
        {
          on = [ "R" "S" "P" ];
          run = "plugin sudo -- paste --force";
          desc = "Sudo force paste";
        }
        {
          on = [ "R" "S" "r" ];
          run = "plugin sudo -- rename";
          desc = "Sudo rename/bulk-rename";
        }
        {
          on = [ "R" "S" "l" "l" ];
          run = "plugin sudo -- link";
          desc = "Sudo link";
        }
        {
          on = [ "R" "S" "l" "r" ];
          run = "plugin sudo -- link --relative";
          desc = "Sudo link relative path";
        }
        {
          on = [ "R" "S" "l" "L" ];
          run = "plugin sudo -- hardlink";
          desc = "Sudo hardlink";
        }
        {
          on = [ "R" "S" "a" ];
          run = "plugin sudo -- create";
          desc = "Sudo create";
        }
        {
          on = [ "R" "S" "d" ];
          run = "plugin sudo -- remove";
          desc = "Sudo trash";
        }
        {
          on = [ "R" "S" "D" ];
          run = "plugin sudo -- remove --permanently";
          desc = "Sudo delete";
        }
        {
          on = [ "R" "S" "m" ];
          run = "plugin sudo -- chmod";
          desc = "Sudo chmod";
        }
			];
		};
	};
}

