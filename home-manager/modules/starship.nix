{
	programs.starship = {
		enable = true;
		enableZshIntegration = true;

		settings = {
			"$schema" = "https://starship.rs/config-schema.json";
			add_newline = true;
      palette = "catppuccin_macchiato";

			format = "[◖](surface1)[█](surface1)$os$username[](bg:blue fg:surface1)$directory[](fg:blue bg:green)$git_branch$git_status[](fg:green) ";
			right_format = "[](fg:surface1)$status[](bg:surface1 fg:text)$kubernetes[](bg:surface1 fg:text)$time[](surface1)";
			os = {
				disabled = false;
				style = "bg:surface1 fg:text";
				symbols = {
					NixOS = "󱄅";
				};
			};
			username = {
				show_always = true;
				style_user = "bg:surface1 fg:text";
				style_root = "bg:surface1 fg:text";
				format = "[ $user ]($style)";
			};
			directory = {
				style = "fg:mantle bg:blue";
				format = "[ $path ]($style)";
				truncation_length = 10;
				truncation_symbol = "…/";
				truncate_to_repo = false;
			};
			git_branch = {
				symbol = "";
				style = "bg:teal";
				format = "[[ $symbol $branch ](fg:base bg:green)]($style)";
			};
			git_status = {
				style = "bg:teal";
				format = "[[($all_status$ahead_behind )](fg:base bg:green)]($style)";
			};
			status = {
				disabled = false;
				style = "bg:surface1";
				failure_style = "bg:surface1 fg:red";
				success_style = "bg:surface1 fg:green";
				success_symbol = "";
				symbol = "";
				not_executable_symbol = "";
				not_found_symbol = "";
				sigint_symbol = "";
				signal_symbol = "";
				format = "[ $symbol $status ]($style)";
			};
			kubernetes = {
				disabled = false;
				style = "bg:surface1 fg:text";
				format = "[ $symbol$context( \($namespace\) )]($style)";
			};
			time = {
				disabled = false;
				time_format = "%Y-%m-%d %H:%M:%S";
				style = "bg:blue";
				format = "[[  $time ](fg:text bg:surface1)]($style)";
			};

      palettes.catppuccin_macchiato = {
        "base" = "#24273a";
        "blue" = "#8aadf4";
        "crust" = "#181926";
        "flamingo" = "#f0c6c6";
        "green" = "#a6da95";
        "lavender" = "#b7bdf8";
        "mantle" = "#1e2030";
        "maroon" = "#ee99a0";
        "mauve" = "#c6a0f6";
        "overlay0" = "#6e738d";
        "overlay1" = "#8087a2";
        "overlay2" = "#939ab7";
        "peach" = "#f5a97f";
        "pink" = "#f5bde6";
        "red" = "#ed8796";
        "rosewater" = "#f4dbd6";
        "sapphire" = "#7dc4e4";
        "sky" = "#91d7e3";
        "subtext0" = "#a5adcb";
        "subtext1" = "#b8c0e0";
        "surface0" = "#363a4f";
        "surface1" = "#494d64";
        "surface2" = "#5b6078";
        "teal" = "#8bd5ca";
        "text" = "#cad3f5";
        "yellow" = "#eed49f";
      };
	  };
	};
}
