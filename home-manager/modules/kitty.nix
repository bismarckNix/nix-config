{
  programs.kitty = {
    enable = true;

    settings = {
      font_family       = "Fira Code";
      font_size         = 14.0;
      bold_font         = "auto";
      italic_font       = "auto";
      bold_italic_font  = "auto";

      cursor_trail = 1;

      disable_ligatures = "never";

      symbol_map = "U+E000-U+F8FF,U+F0001-U+F1AF0 Symbols Nerd Font Mono";

      background_opacity = 0.5;
      confirm_os_window_close = 0;

      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;

      enable_audio_bell = false;
      hide_window_decorations = true;

      window_padding_width = 4;

      include = "./themes/noctalia.conf";
    };
  };
}
