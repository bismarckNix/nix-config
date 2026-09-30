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

      plugin = {
        prepend_preloaders = [
          # Office Documents
          { mime = "application/openxmlformats-officedocument.*"; run = "office"; }
          { mime = "application/oasis.opendocument.*"; run = "office"; }
          { mime = "application/ms-*"; run = "office"; }
          { mime = "application/msword"; run = "office"; }
          { url = "*.docx"; run = "office"; }
        ];

        prepend_previewers = [
          # Office Documents
          { mime = "application/openxmlformats-officedocument.*"; run = "office"; }
          { mime = "application/oasis.opendocument.*"; run = "office"; }
          { mime = "application/ms-*"; run = "office"; }
          { mime = "application/msword"; run = "office"; }
          { url = "*.docx"; run = "office"; }
        ];
      };
		};

    plugins = with pkgs.yaziPlugins; {
      inherit chmod;
      inherit compress;
      inherit lazygit;
      inherit mount;
      inherit smart-enter;
      inherit toggle-pane;

      full-border = {
        package = full-border;
        setup = true;
      };
      starship = {
        package = starship;
        setup = true;
      };

      office = pkgs.stdenvNoCC.mkDerivation {
        pname = "office.yazi";
        version = "patched";
        src = pkgs.yaziPlugins.office;
        installPhase = ''
          mkdir $out
          cp -r $src/* $out/
          sed -i 's/ya\.preview_widgets/ya.preview_widget/g' $out/main.lua
        '';
      };
    };

		keymap = {
			mgr.prepend_keymap = [
        # Bookmarks
        {
          on = [ "g" "p" ];
          run = "cd ~/Pictures";
          desc = "Go to ~/Pictures";
        } {
          on = [ "g" "n" ];
          run = "cd ~/nix-config";
          desc = "Go to ~/nix-config";
        }

        {
          on = "l";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        } {
					on = "T";
					run = "plugin toggle-pane max-preview";
					desc = "Maximize or restore the preview pane";
				} {
					on = [ "c" "m" ];
					run = "plugin chmod";
					desc = "Chmod on selected files";
				} {
          on = ["R" "e"];
          run = "shell 'trash-empty' --block --interactive";
          desc = "Empty trash older than N days";
        } {
          on = [ "g" "i" ];
          run = "plugin lazygit";
          desc = "Run Lazygit";
        } {
          on = "M";
          run = "plugin mount";
        }

        # Compress
        {
          on   = [ "c" "a" "a" ];
          run  = "plugin compress";
          desc = "Archive selected files";
        } {
          on   = [ "c" "a" "p" ];
          run  = "plugin compress -p";
          desc = "Archive selected files (password)";
        } {
          on   = [ "c" "a" "h" ];
          run  = "plugin compress -ph";
          desc = "Archive selected files (password+header)";
        } {
          on   = [ "c" "a" "l" ];
          run  = "plugin compress -l";
          desc = "Archive selected files (compression level)";
        } {
          on   = [ "c" "a" "u" ];
          run  = "plugin compress -phl";
          desc = "Archive selected files (password+header+level)";
        }
			];
		};
	};
}

