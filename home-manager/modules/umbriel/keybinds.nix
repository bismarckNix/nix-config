{
	programs.umbriel.settings = {
		keybinds = {
			# General
			"Mod+O" = "overview-toggle";
			"Mod+Escape" = "overview-toggle";
			"Mod+Space" = "keyboard-layout-next";
			"Mod+Shift+Escape" = "session-quit";

			# Layout
			"Mod+Shift+T" = "workspace-set-layout:toggle";
			"Mod+Shift+Q" = "workspace-set-layout:scrolling";
			"Mod+Shift+W" = "workspace-set-layout:dwindle";
			"Mod+Shift+E" = "workspace-set-layout:master";
			"Mod+Alt+Space" = "scratchpad-toggle";
			"Mod+Shift+Space" = "window-move-to-scratchpad";
			"Mod+Ctrl+Space" = "window-restore-from-scratchpad";
			"Mod+Tab" = "scratchpad-focus-next";

			# Window actions
			"Mod+Q" = "window-close";

			"Mod+Left" = "window-focus-left";
			"Mod+Down" = "window-focus-down";
			"Mod+Up" = "window-focus-up";
			"Mod+Right" = "window-focus-right";
			"Mod+H" = "window-focus-left";
			"Mod+J" = "window-focus-down";
			"Mod+K" = "window-focus-up";
			"Mod+L" = "window-focus-right";

			"Mod+Ctrl+Left" = "column-move-left";
			"Mod+Ctrl+Down" = "window-move-down";
			"Mod+Ctrl+Up" = "window-move-up";
			"Mod+Ctrl+Right" = "column-move-right";
			"Mod+Ctrl+H" = "column-move-left";
			"Mod+Ctrl+J" = "window-move-down";
			"Mod+Ctrl+K" = "window-move-up";
			"Mod+Ctrl+L" = "column-move-right";

			"Mod+V" = "window-toggle-floating";
			"Mod+P" = "window-toggle-pinned";
			"Mod+C" = "column-center";
			"Mod+Ctrl+C" = "window-center";
			"Mod+Shift+Comma" = "window-consume-or-expel-left";
			"Mod+Shift+Period" = "window-consume-or-expel-right";

			# Window sizes
			"Mod+F" = "window-toggle-maximize";
			"Mod+M" = "window-toggle-maximize-to-edges";
			"Mod+Shift+F" = "window-toggle-fullscreen";
			"Mod+R" = "window-cycle-primary-extent";
			"Mod+Ctrl+R" = "window-cycle-primary-extent-back";
			"Mod+Minus" = "window-modify-width-right:-0.1";
			"Mod+Equal" = "window-modify-width-right:0.1";
			"Mod+Shift+Minus" = "window-modify-height-down:0.1";
			"Mod+Shift+Equal" = "window-modify-height-up:0.1";

			# Workspaces
			"Mod+Comma" = "workspace-previous";
			"Mod+Period" = "workspace-next";
			"Mod+Ctrl+Comma" = "window-move-to-workspace-previous";
			"Mod+Ctrl+Period" = "window-move-to-workspace-next";
			"Mod+1" = "workspace-switch:1";
			"Mod+2" = "workspace-switch:2";
			"Mod+3" = "workspace-switch:3";
			"Mod+4" = "workspace-switch:4";
			"Mod+5" = "workspace-switch:5";
			"Mod+6" = "workspace-switch:6";
			"Mod+7" = "workspace-switch:7";
			"Mod+8" = "workspace-switch:8";
			"Mod+9" = "workspace-switch:9";
			"Mod+Ctrl+1" = "window-move-to-workspace:1";
			"Mod+Ctrl+2" = "window-move-to-workspace:2";
			"Mod+Ctrl+3" = "window-move-to-workspace:3";
			"Mod+Ctrl+4" = "window-move-to-workspace:4";
			"Mod+Ctrl+5" = "window-move-to-workspace:5";
			"Mod+Ctrl+6" = "window-move-to-workspace:6";
			"Mod+Ctrl+7" = "window-move-to-workspace:7";
			"Mod+Ctrl+8" = "window-move-to-workspace:8";
			"Mod+Ctrl+9" = "window-move-to-workspace:9";

      # F keys
      "F1" = "spawn:noctalia msg volume-mute";
      "F2" = "spawn:noctalia msg volume-down";
      "F3" = "spawn:noctalia msg volume-up";
      "F4" = "spawn:noctalia msg mic-mute";
      "F5" = "spawn:noctalia msg brightness-down";
      "F6" = "spawn:noctalia msg brightness-up";

			# Noctalia
			"Mod+D" = "spawn:noctalia msg panel-toggle launcher";
			"Alt+Tab" = "spawn:noctalia msg window-switcher";
			"Mod+Shift+A" = "spawn:noctalia msg screenshot-fullscreen";
			"Mod+Shift+S" = "spawn:noctalia msg screenshot-region";
			"Mod+Shift+L" = "spawn:noctalia msg session lock";
			"Mod+X" = "spawn:noctalia msg mic-mute";
			"Mod+Shift+Z" = "spawn:noctalia msg notification-dnd-toggle";
			"Mod+Shift+X" = "spawn:noctalia msg notification-clear-active";
			"Mod+Shift+G" = "spawn:noctalia msg panel-toggle clipboard";
			"Mod+Shift+R" = "spawn:noctalia msg plugin noctalia/screen_recorder:service all toggle";

			# Dev
			"Mod+Return" = "spawn:kitty";
			"Mod+A" = "spawn:nemo";
      "Mod+Ctrl+E" = "spawn:kitty --class yazi yazi";
			"Mod+N" = "spawn:kitty --class lazyvim nvim";

			# Proxy
			"Mod+Shift+V" = "spawn:clash-verge";

			# Browsers
			"Mod+E" = "spawn:zen";
			"Mod+B" = "spawn:brave-origin";

			# Media
			"Mod+Z" = "spawn:vesktop";
			"Mod+Ctrl+T" = "spawn:Telegram";
			"Mod+Shift+C" = "spawn:pear-desktop";

			# Games
			"Mod+Y" = "spawn:steam";
			"Mod+G" = "spawn:freesmlauncher";
		};
	};
}
