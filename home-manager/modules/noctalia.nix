{
  programs.noctalia = {
	enable = true;

	settings = {
      audio = {
        enable_overdrive = true;
        enable_sounds = true;
      };
      backdrop = {
        blur_intensity = 0.2;
        enabled = true;
      };
      bar = {
        order = [ "top" "window-left" "window-right" ];
        top = {
          background_opacity = 0.0;
          capsule = true;
          capsule_opacity = 0.7;
          capsule_radius = 3;
          center = [ "workspaces" ];
          end = [ "tray" "andrewdems/printers:printer" "status" "notifications" "clipboard" "spacer_long" "group:g3" "spacer_long" "group:g2" ];
          margin_ends = 0;
          radius = 0;
          shadow = false;
          start = [ "group:g1" "spacer_long" "avivbintangaringga/nix-monitor:nix-monitor" "media" ];
          dead_zone = {
            actions = {
              middle = "settings-toggle";
              scroll_down = "workspace-switch next";
              scroll_up = "workspace-switch prev";
            };
          };
          capsule_group = [ {
            accordion = false;
            accordion_direction = "end";
            enabled = true;
            fill = "surface_variant";
            id = "g1";
            members = [ "launcher" "line" "date" "line" "clock" ];
            opacity = 0.7;
            padding = 8.0;
            radius = 2.0;
          } {
            accordion = false;
            accordion_direction = "end";
            enabled = true;
            fill = "surface_variant";
            id = "g2";
            members = [ "control-center" "line" "session" ];
            opacity = 0.7;
            padding = 8.0;
            radius = 3.0;
          } {
            accordion = false;
            accordion_direction = "end";
            enabled = true;
            fill = "surface_variant";
            id = "g3";
            members = [ "output_volume" "line" "input_volume" ];
            opacity = 0.7;
            padding = 8.0;
            radius = 3.0;
          } ];
        };
        window-left = {
          auto_hide = true;
          background_opacity = 0.7;
          center = [ "window-switch-left" "window-switch-left" "window-switch-left" ];
          enabled = true;
          end = [  ];
          position = "left";
          radius = 3;
          reserve_space = false;
          scale = 1.25;
          shadow = false;
          show_on_workspace_switch = false;
          start = [  ];
          thickness = 10;
          dead_zone = {
            actions = {
              left = "exec umbriel msg window-focus-left";
              right = "exec umbriel msg column-move-left";
            };
          };
        };
        window-right = {
          auto_hide = true;
          background_opacity = 0.7;
          center = [ "window-switch-right" "window-switch-right" "window-switch-right" ];
          enabled = true;
          end = [  ];
          position = "right";
          radius = 3;
          reserve_space = false;
          scale = 1.25;
          shadow = false;
          show_on_workspace_switch = false;
          start = [  ];
          thickness = 10;
          dead_zone = {
            actions = {
              left = "exec umbriel msg window-focus-right";
              right = "exec umbriel msg column-move-right";
            };
          };
        };
      };
      brightness = {
        enable_ddcutil = true;
      };
      calendar = {
        enabled = true;
        account = {
          personal = {
            color = "primary";
            type = "google";
          };
        };
      };
      control_center = {
        sidebar = "full";
        width = 800;
        calendar = {
          show_week_numbers = true;
        };
        shortcuts = [ {
          type = "wifi";
        } {
          type = "caffeine";
        } {
          type = "nightlight";
        } {
          type = "notification";
        } {
          type = "power_profile";
        } {
          type = "weather";
        } ];
      };
      desktop_widgets = {
        schema_version = 2;
        widget_order = [ "desktop-widget-0000000000000001" ];
        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };
        widget = {
          desktop-widget-0000000000000001 = {
            box_height = 64.0;
            box_width = 2304.0;
            cx = 960.0;
            cy = 0.0;
            output = "DP-1";
            placement_height = 1080.0;
            placement_width = 1920.0;
            rotation = 0.0;
            type = "audio_visualizer";
            settings = {
              background = false;
              bands = 128;
              show_when_idle = true;
            };
          };
        };
      };
      dock = {
        background_opacity = 0.5;
        concave_edge_corners = false;
        enabled = false;
        launcher_position = "start";
        margin_edge = 12;
        radius = 3;
        reserve_space = false;
        show_dots = true;
        smart_auto_hide = true;
      };
      hot_corners = {
        delay_ms = 600;
      };
      idle = {
        behavior_order = [ "lock" "screen-off" "lock-and-suspend" ];
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600.0;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900.0;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660.0;
          };
        };
      };
      location = {
        address = "Khimki, Russia";
      };
      lockscreen = {
        blur_intensity = 0.2;
      };
      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;
        widget_order = [ "lockscreen-login-box@WL-1" "lockscreen-login-box@output-0" "lockscreen-login-box@winit" "lockscreen-login-box@DP-1" "lockscreen-widget-000000000000000b" "lockscreen-widget-000000000000000c" "lockscreen-widget-000000000000000d" ];
        grid = {
          cell_size = 8;
          major_interval = 4;
          visible = true;
        };
        widget = {
          "lockscreen-login-box@DP-1" = {
            box_height = 128.0;
            box_width = 720.0;
            cx = 960.0;
            cy = 860.0;
            output = "DP-1";
            placement_height = 1080.0;
            placement_width = 1920.0;
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface";
              background_opacity = 0.8;
              background_radius = 0.0;
              center_password_text = false;
              input_opacity = 0.55;
              input_radius = 3.0;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = false;
              show_session_buttons = true;
              show_unlock_hint = false;
              show_weather = false;
            };
          };
          "lockscreen-login-box@WL-1" = {
            box_height = 196.0;
            box_width = 810.0;
            cx = 472.0;
            cy = 844.0;
            output = "WL-1";
            placement_height = 1026.0;
            placement_width = 944.0;
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              center_password_text = false;
              input_opacity = 1.0;
              input_radius = 6.0;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = true;
              show_session_buttons = true;
              show_unlock_hint = true;
              show_weather = true;
            };
          };
          "lockscreen-login-box@output-0" = {
            box_height = 196.0;
            box_width = 810.0;
            cx = 960.0;
            cy = 864.0;
            output = "output-0";
            placement_height = 1046.0;
            placement_width = 1920.0;
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              center_password_text = false;
              input_opacity = 1.0;
              input_radius = 6.0;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = true;
              show_session_buttons = true;
              show_unlock_hint = true;
              show_weather = true;
            };
          };
          "lockscreen-login-box@winit" = {
            box_height = 196.0;
            box_width = 810.0;
            cx = 640.0;
            cy = 618.0;
            output = "winit";
            placement_height = 800.0;
            placement_width = 1280.0;
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              center_password_text = false;
              input_opacity = 1.0;
              input_radius = 6.0;
              layout = "regular";
              show_caps_lock = true;
              show_keyboard_layout = true;
              show_login_button = true;
              show_media = true;
              show_session_buttons = true;
              show_unlock_hint = true;
              show_weather = true;
            };
          };
          lockscreen-widget-000000000000000b = {
            box_height = 232.0;
            box_width = 608.0;
            cx = 960.0;
            cy = 440.0;
            output = "DP-1";
            placement_height = 1080.0;
            placement_width = 1920.0;
            rotation = 0.0;
            type = "clock";
            settings = {
              background = false;
              font_family = "Unifont";
            };
          };
          lockscreen-widget-000000000000000c = {
            box_height = 120.0;
            box_width = 576.0;
            cx = 960.0;
            cy = 580.0;
            output = "DP-1";
            placement_height = 1080.0;
            placement_width = 1920.0;
            rotation = 0.0;
            type = "label";
            settings = {
              background = false;
              color = "hover";
              font_family = "Unifont";
              title = "L O C K E D";
            };
          };
          lockscreen-widget-000000000000000d = {
            box_height = 128.0;
            box_width = 2328.0;
            cx = 960.0;
            cy = 0.0;
            output = "DP-1";
            placement_height = 1080.0;
            placement_width = 1920.0;
            rotation = 0.0;
            type = "audio_visualizer";
            settings = {
              background = false;
              bands = 128;
              show_when_idle = true;
            };
          };
        };
      };
      notification = {
        background_opacity = 0.8;
      };
      osd = {
        background_opacity = 0.8;
        border = false;
        orientation = "vertical";
        position_vertical = "top_right";
        kinds = {
          media = false;
        };
      };
      plugin_settings = {
        "alexander/screen-toolkit" = {
          panel-legacy_open_near_click = true;
          panel-legacy_position = "auto";
          panel_open_near_click = true;
          panel_position = "auto";
          result_open_near_click = true;
          result_position = "auto";
        };
        "andrewdems/printers" = {
          panel_placement = "floating";
        };
        "aristides/udiskie" = {
          manager_open_near_click = true;
        };
        "arrifat346afs/systempulse" = {
          panel_placement = "floating";
          panel_position = "auto";
        };
        "avivbintangaringga/nix-monitor" = {
          panel_placement = "floating";
          update_command = "nh os switch --update $HOME/nix-config";
        };
        "noctalia/mpvpaper" = {
          picker_placement = "floating";
        };
        "noctalia/wallhaven" = {
          browser_placement = "floating";
        };
        "noctalia/umbriel-companion" = {
          panel_placement = "floating";
        };
        "yuuto/calculator" = {
          panel_placement = "floating";
        };
      };
      plugins = {
        auto_update = "all";
        enabled = [ "alexander/screen-toolkit" "andrewdems/printers" "aristides/udiskie" "arrifat346afs/systempulse" "avivbintangaringga/nix-monitor" "davemhammer/obsidian" "kjvdven/case-convert" "noctalia/kaomoji" "noctalia/mpvpaper" "noctalia/screen_recorder" "noctalia/wallhaven" "noctalia/wallpaper_depth" "yuuto/calculator" "weinguyen/shell-command" ];
        source = [ {
          kind = "git";
          location = "https://github.com/noctalia-dev/official-plugins";
          name = "official";
        } {
          kind = "git";
          location = "https://github.com/noctalia-dev/community-plugins";
          name = "community";
        } ];
      };
      shell = {
        button_borders = false;
        card_borders = false;
        corner_radius_scale = 0.5;
        input_borders = false;
        panel_anchor_bar = "top";
        polkit_agent = true;
        popup_borders = false;
        screen_time_enabled = true;
        show_location = false;
        animation = {
          speed = 0.7;
        };
        launcher = {
          providers = {
            emoji = {
              global = false;
            };
            session = {
              global = false;
            };
            wallpaper = {
              global = false;
            };
            windows = {
              global = false;
            };
          };
        };
        panel = {
          borders = false;
          control_center_placement = "floating";
          list_item_background = true;
          open_near_click_control_center = true;
          session_placement = "floating";
          transparency_mode = "glass";
          wallpaper_placement = "floating";
        };
        screenshot = {
          confirm_region = true;
          directory = "~/Pictures/Screenshots";
          remember_last_region = true;
        };
        session = {
          actions = [ {
            action = "lock";
            countdown_seconds = 3.0;
            enabled = true;
            shortcut = "1";
            variant = "default";
          } {
            action = "logout";
            countdown_seconds = 3.0;
            enabled = true;
            shortcut = "2";
            variant = "default";
          } {
            action = "lock_and_suspend";
            countdown_seconds = 3.0;
            enabled = true;
            shortcut = "3";
            variant = "default";
          } {
            action = "reboot";
            countdown_seconds = 3.0;
            enabled = true;
            shortcut = "4";
            variant = "default";
          } {
            action = "shutdown";
            countdown_seconds = 3.0;
            enabled = true;
            shortcut = "5";
            variant = "destructive";
          } ];
        };
      };
      theme = {
        builtin = "Ayu";
        custom_palette = "catpuccin-mc";
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-rainbow";
        templates = {
          builtin_ids = [ "btop" "kitty" "niri" "starship" "umbriel" ];
          community_ids = [ "discord" "telegram" "vscode" "steam" ];
        };
      };
      wallpaper = {
        default = {
          path = "~/nix-config/pictures/nixos-wallpaper.png";
        };
        directory = "/home/bismarck/Pictures/Wallpapers";
        favorite = {
          palette_source = "wallpaper";
          path = "~/nix-config/pictures/nixos-wallpaper.png";
          theme_mode = "dark";
          wallpaper_scheme = "m3-rainbow";
        };
        transition_on_startup = true;
      };
      widget = {
        audio_visualizer = {
          bands = 128;
          width = 1540;
        };
        "avivbintangaringga/nix-monitor:nix-monitor" = {
          colorize_glyph = false;
          show_text = false;
          up_to_date_glyph = "square-rounded-check";
        };
        clipboard = {
          capsule_radius = "auto";
          actions = {
            right = "panel-toggle yuuto/calculator:panel";
          };
        };
        clock = {
          tooltip_format = "{:%x, %H:%M:%S}";
        };
        control-center = {
          actions = {
            right = "panel-toggle alexander/screen-toolkit:panel";
          };
        };
        date = {
          format = "{:%a, %d %b}";
          tooltip_format = "{:%x, %H:%M:%S}";
        };
        input_volume = {
          capsule = true;
          capsule_padding = 2;
        };
        launcher = {
          custom_image = "~/nix-config/pictures/nixos.png";
          custom_image_colorize = true;
          scale = 1.25;
          actions = {
            forward = "panel-toggle noctalia/mpvpaper:picker";
            right = "panel-toggle noctalia/wallhaven:browser";
          };
        };
        line = {
          capsule_padding = 0;
          capsule_radius = "auto";
          interactive = false;
          scale = 1.15;
          text = "⏐";
          type = "text";
        };
        media = {
          max_length = 200;
          show_progress = true;
          title_scroll = "always";
        };
        notifications = {
          capsule = true;
        };
        output_volume = {
          capsule_opacity = 0.0;
          capsule_padding = 0;
          capsule_radius = 3;
        };
        session = {
          actions = {
            right = "panel-toggle arrifat346afs/systempulse:panel";
          };
        };
        spacer_long = {
          length = 24;
          type = "spacer";
        };
        status = {
          hide_when_empty = true;
          type = "aristides/udiskie:status";
        };
        tray = {
          capsule_radius = "auto";
        };
        window-switch-left = {
          glyph = "arrow-badge-left-filled";
          interactive = false;
          type = "custom_button";
        };
        window-switch-right = {
          glyph = "arrow-badge-right-filled";
          interactive = false;
          type = "custom_button";
        };
        workspaces = {
          show_labels = false;
        };
      };
		};
	};
}