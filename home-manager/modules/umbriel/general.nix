{
	programs.umbriel.settings = {
		general = {
			autostart = [ "noctalia" ];
			xwayland = true;
			show_cheatsheet = false;
			focus_on_activate = false;
			honor_restored_maximize = false;
		};
		environment = {
			GTK_THEME = "Adwaita:dark";
			QT_QPA_PLATFORMTHEME = "qt6ct";
		};
		workspaces = {
			back_and_forth = true;
			empty_above = false;
		};
		overview = {
			zoom = 0.5;
		};
		hot_corners = {
			top_left = {
				enabled = true;
				delay_ms = 200;
				action = "overview-open";
			};
		};
	};
}
