{
  xdg.configFile."niri/cfg/keybinds.kdl".text = ''
    binds {
    // ###################################################################################################################
    // Main
    // ###################################################################################################################

      Mod+Shift+Slash                                                          { show-hotkey-overlay; }

      Mod+Return        hotkey-overlay-title="Open Terminal: Kitty"            { spawn "kitty"; }
      Mod+Shift+D       hotkey-overlay-title="Run Application Launcher"        { spawn-sh "noctalia msg panel-toggle launcher"; }
      Super+Shift+L     hotkey-overlay-title="Lock the Screen"                 { spawn-sh "noctalia msg session lock"; }
      Mod+Space         hotkey-overlay-title="Switch Keyboard Layout"          { switch-layout "next"; }

      Mod+Shift+S       hotkey-overlay-title="Screenshot region"               { screenshot; }
      Mod+Shift+A       hotkey-overlay-title="Screenshot screen"               { screenshot-screen; }
      Mod+Shift+W       hotkey-overlay-title="Screenshot window"               { screenshot-window; }
      Mod+Shift+Q       hotkey-overlay-title="Record Screen"                   { spawn-sh "noctalia msg plugin noctalia/screen_recorder:service all toggle"; }
    
      Mod+Shift+E                                                              { quit; }
      Ctrl+Alt+Delete                                                          { quit; }

    // ###################################################################################################################
    // Window Navigation
    // ###################################################################################################################

      Mod+O        repeat=false             { toggle-overview; }
      Mod+Escape   repeat=false             { toggle-overview; }

      Mod+Q        repeat=false             { close-window; }

      Mod+Left                              { focus-column-left; }
      Mod+Down                              { focus-window-down; }
      Mod+Up                                { focus-window-up; }
      Mod+Right                             { focus-column-right; }
      Mod+A                                 { focus-column-left; }
      Mod+S                                 { focus-window-down; }
      Mod+W                                 { focus-window-up; }
      Mod+D                                 { focus-column-right; }

      Mod+Ctrl+Left                         { move-column-left; }
      Mod+Ctrl+Down                         { move-window-down; }
      Mod+Ctrl+Up                           { move-window-up; }
      Mod+Ctrl+Right                        { move-column-right; }
      Mod+Ctrl+A                            { move-column-left; }
      Mod+Ctrl+S                            { move-window-down; }
      Mod+Ctrl+W                            { move-window-up; }
      Mod+Ctrl+D                            { move-column-right; }

      Mod+Shift+WheelScrollDown             { focus-column-right; }
      Mod+Shift+WheelScrollUp               { focus-column-left; }

      Mod+Ctrl+Shift+WheelScrollDown        { move-column-right; }
      Mod+Ctrl+Shift+WheelScrollUp          { move-column-left; }

      Mod+Alt+Left                          { focus-column-first; }
      Mod+Alt+Right                         { focus-column-last; }
      Mod+Ctrl+Alt+Left                     { move-column-to-first; }
      Mod+Ctrl+Alt+Right                    { move-column-to-last; }
      Mod+Alt+A                             { focus-column-first; }
      Mod+Alt+D                             { focus-column-last; }
      Mod+Ctrl+Alt+A                        { move-column-to-first; }
      Mod+Ctrl+Alt+D                        { move-column-to-last; }

      Mod+C                                 { center-column; }
      Mod+Ctrl+C                            { center-visible-columns; }

      Mod+BracketLeft                       { consume-or-expel-window-left; }
      Mod+BracketRight                      { consume-or-expel-window-right; }

      Mod+Comma                             { consume-window-into-column; }
      Mod+Period                            { expel-window-from-column; }

      Mod+V                                 { toggle-window-floating; }

    // ###################################################################################################################
    // Window Sizes
    // ###################################################################################################################

      Mod+Minus          { set-column-width "-10%"; }
      Mod+Equal          { set-column-width "+10%"; }

      Mod+Shift+Minus    { set-window-height "-10%"; }
      Mod+Shift+Equal    { set-window-height "+10%"; }

      Mod+R              { switch-preset-column-width; }
      Mod+Shift+R        { switch-preset-column-width-back; }

      Mod+Ctrl+Shift+R   { switch-preset-window-height; }
      Mod+Ctrl+R         { reset-window-height; }

      Mod+F              { maximize-column; }
      Mod+M              { maximize-window-to-edges; }
      Mod+Shift+F        { fullscreen-window; }
      Mod+Ctrl+F         { expand-column-to-available-width; }

      Mod+Alt+W          { toggle-column-tabbed-display; }

    // ###################################################################################################################
    // Workspaces
    // ###################################################################################################################

      Mod+1                                        { focus-workspace 1; }
      Mod+2                                        { focus-workspace 2; }
      Mod+3                                        { focus-workspace 3; }
      Mod+4                                        { focus-workspace 4; }
      Mod+5                                        { focus-workspace 5; }
      Mod+6                                        { focus-workspace 6; }
      Mod+7                                        { focus-workspace 7; }
      Mod+8                                        { focus-workspace 8; }
      Mod+9                                        { focus-workspace 9; }

      Mod+Ctrl+1                                   { move-column-to-workspace 1; }
      Mod+Ctrl+2                                   { move-column-to-workspace 2; }
      Mod+Ctrl+3                                   { move-column-to-workspace 3; }
      Mod+Ctrl+4                                   { move-column-to-workspace 4; }
      Mod+Ctrl+5                                   { move-column-to-workspace 5; }
      Mod+Ctrl+6                                   { move-column-to-workspace 6; }
      Mod+Ctrl+7                                   { move-column-to-workspace 7; }
      Mod+Ctrl+8                                   { move-column-to-workspace 8; }

      Mod+Page_Down                                { focus-workspace-down; }
      Mod+Page_Up                                  { focus-workspace-up; }
      Mod+U                                        { focus-workspace-down; }
      Mod+I                                        { focus-workspace-up; }
      Mod+Ctrl+Page_Down                           { move-column-to-workspace-down; }
      Mod+Ctrl+Page_Up                             { move-column-to-workspace-up; }
      Mod+Ctrl+U                                   { move-column-to-workspace-down; }

      Mod+Shift+Page_Down                          { move-workspace-down; }
      Mod+Shift+Page_Up                            { move-workspace-up; }
      Mod+Shift+U                                  { move-workspace-down; }
      Mod+Shift+I                                  { move-workspace-up; }

      Mod+WheelScrollDown        cooldown-ms=150   { focus-workspace-down; }
      Mod+WheelScrollUp          cooldown-ms=150   { focus-workspace-up; }
      Mod+Ctrl+WheelScrollDown   cooldown-ms=150   { move-column-to-workspace-down; }
      Mod+Ctrl+WheelScrollUp     cooldown-ms=150   { move-column-to-workspace-up; }

    // ###################################################################################################################
    // Custom
    // ###################################################################################################################

      Mod+X         hotkey-overlay-title="Mute Microphone"   repeat=false    { spawn-sh "noctalia msg mic-mute"; }
      Mod+Shift+Z   hotkey-overlay-title="Toggle Do Not Disturb Mode"        { spawn-sh "noctalia msg notification-dnd-toggle"; }
      Mod+Shift+X   hotkey-overlay-title="Dissmis Notifications"             { spawn-sh "noctalia msg notification-clear-active"; }
      Mod+Shift+G   hotkey-overlay-title="Open Clipboard"                    { spawn-sh "noctalia msg panel-toggle clipboard"; }

      Mod+Ctrl+V    hotkey-overlay-title="Open Proxy Client: Clash Verge"    { spawn "clash-verge"; }
      Mod+E         hotkey-overlay-title="Open Browser: Zen"                 { spawn "zen"; }
      Mod+B         hotkey-overlay-title="Open Browser: Brave Origin"        { spawn "brave-origin"; }
      Mod+Ctrl+E    hotkey-overlay-title="Open File Manager: Nemo"           { spawn "nemo"; }
      Mod+N         hotkey-overlay-title="Open Code Editor: LazyVim"         { spawn-sh "kitty --class lazyvim nvim"; }
      Mod+Ctrl+N    hotkey-overlay-title="Open Code Editor: VSCodium"        { spawn "codium"; }

      Mod+Z         hotkey-overlay-title="Open Vesktop"                      { spawn "vesktop"; }
      Mod+T         hotkey-overlay-title="Open Telegram Desktop"             { spawn "Telegram"; }
      Mod+Ctrl+B    hotkey-overlay-title="Open Music Player: Pear Desktop"   { spawn "pear-desktop"; }
      Mod+Y         hotkey-overlay-title="Open Steam"                        { spawn "steam"; }
      Mod+G         hotkey-overlay-title="Open FreesmLauncher"               { spawn "freesmlauncher"; }
    }
  '';
}
