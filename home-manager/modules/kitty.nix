{
  programs.kitty = {
    enable = true;

    settings = {
      font_family       = "Hack Regular";
      font_size         = 14.0;
      bold_font         = "auto";
      italic_font       = "auto";
      bold_italic_font  = "auto";

      cursor_trail = 1;

      disable_ligatures = false;

      unicode_ambiguous_width = "double";

      symbol_map = "U+23FB-U+23FE,U+2665,U+26A1,U+2B58,U+E000-U+E00A,U+E0A0-U+E0A3,U+E0B0-U+E0D4,U+E200-U+E2A9,U+E300-U+E3E3,U+E6AA,U+E700-U+E7C5,U+EA60-U+EBEB,U+F000-U+F2E0,U+F300-U+F32F,U+F400-U+F4A9,U+F500-U+F8FF,U+F0001-U+F1AF0,U+EFC5,U+F4BC Symbols Nerd Font Mono";

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