{
  xdg.configFile."niri/cfg/keybinds.kdl".text = ''
    binds {
    // ###################################################################################################################
    // Main
    // ###################################################################################################################

      Mod+Shift+Slash                                                          { show-hotkey-overlay; }

      Mod+Return        hotkey-overlay-title="Open Terminal: Kitty"            { spawn "kitty"; }
      Mod+D             hotkey-overlay-title="Run Application Launcher"        { spawn-sh "noctalia msg panel-toggle launcher"; }
      Super+Shift+L     hotkey-overlay-title="Lock the Screen"                 { spawn-sh "noctalia msg session lock"; }
      Mod+Space         hotkey-overlay-title="Switch Keyboard Layout"          { switch-layout "next"; }

      Mod+Shift+S       hotkey-overlay-title="Screenshot region"               { screenshot; }
      Mod+Shift+A       hotkey-overlay-title="Screenshot screen"               { screenshot-screen; }
      Mod+Shift+W       hotkey-overlay-title="Screenshot window"               { screenshot-window; }
      Mod+Shift+Q       hotkey-overlay-title="Record Screen"                   { spawn-sh "noctalia msg plugin noctalia/screen_recorder:service all toggle"; }

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
      Mod+H                                 { focus-column-left; }
      Mod+J                                 { focus-window-down; }
      Mod+K                                 { focus-window-up; }
      Mod+L                                 { focus-column-right; }

      Mod+Ctrl+Left                         { move-column-left; }
      Mod+Ctrl+Down                         { move-window-down; }
      Mod+Ctrl+Up                           { move-window-up; }
      Mod+Ctrl+Right                        { move-column-right; }
      Mod+Ctrl+H                            { move-column-left; }
      Mod+Ctrl+J                            { move-window-down; }
      Mod+Ctrl+K                            { move-window-up; }
      Mod+Ctrl+L                            { move-column-right; }

      Mod+Shift+WheelScrollDown             { focus-column-right; }
      Mod+Shift+WheelScrollUp               { focus-column-left; }

      Mod+Ctrl+Shift+WheelScrollDown        { move-column-right; }
      Mod+Ctrl+Shift+WheelScrollUp          { move-column-left; }

      Mod+Alt+Left                          { focus-column-first; }
      Mod+Alt+Right                         { focus-column-last; }
      Mod+Ctrl+Alt+Left                     { move-column-to-first; }
      Mod+Ctrl+Alt+Right                    { move-column-to-last; }
      Mod+Alt+H                             { focus-column-first; }
      Mod+Alt+L                             { focus-column-last; }
      Mod+Ctrl+Alt+H                        { move-column-to-first; }
      Mod+Ctrl+Alt+L                        { move-column-to-last; }

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

      Mod+W              { toggle-column-tabbed-display; }

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
      Mod+Ctrl+I                                   { move-column-to-workspace-up; }

      Mod+Shift+Page_Down                          { move-workspace-down; }
      Mod+Shift+Page_Up                            { move-workspace-up; }
      Mod+Shift+U                                  { move-workspace-down; }
      Mod+Shift+I                                  { move-workspace-up; }

      Mod+WheelScrollDown        cooldown-ms=150   { focus-workspace-down; }
      Mod+WheelScrollUp          cooldown-ms=150   { focus-workspace-up; }
      Mod+Ctrl+WheelScrollDown   cooldown-ms=150   { move-column-to-workspace-down; }
      Mod+Ctrl+WheelScrollUp     cooldown-ms=150   { move-column-to-workspace-up; }

    // ###################################################################################################################
    // XF86 Keys
    // ###################################################################################################################

      XF86AudioMute             hotkey-overlay-title="Mute Audio"       allow-when-locked=true repeat=false   { spawn-sh "noctalia msg volume-mute"; }
      XF86AudioLowerVolume      hotkey-overlay-title="Lower Volume"     allow-when-locked=true                { spawn-sh "noctalia msg volume-down"; }
      XF86AudioRaiseVolume      hotkey-overlay-title="Raise Volume"     allow-when-locked=true                { spawn-sh "noctalia msg volume-up"; }
      XF86AudioMicMute          hotkey-overlay-title="Mute Microphone"  allow-when-locked=true repeat=false   { spawn-sh "noctalia msg mic-mute"; }

      XF86MonBrightnessDown     hotkey-overlay-title="Lower Brightness" allow-when-locked=true                { spawn-sh "noctalia msg brightness-down"; }
      XF86MonBrightnessUp       hotkey-overlay-title="Raise Brightness" allow-when-locked=true                { spawn-sh "noctalia msg brightness-up"; }
      XF86Display               hotkey-overlay-title="Turn Off Display" allow-when-locked=true repeat=false   { spawn-sh "noctalia msg dpms-off"; }
      XF86WLAN                  hotkey-overlay-title="Toggle Wi-FI"     allow-when-locked=true repeat=false   { spawn-sh "noctalia msg wifi-toggle"; }

      XF86NotificationCenter    hotkey-overlay-title="Open Notification Center"                               { spawn-sh "noctalia msg panel-toggle control-center notifications"; }
      XF86PickupPhone           hotkey-overlay-title="Accept Latest Notification"                             { spawn-sh "noctalia msg notification-invoke-latest"; }
      XF86HangupPhone           hotkey-overlay-title="Dismiss Notifications"                                  { spawn-sh "noctalia msg notification-clear-active"; }
      XF86Favorites             hotkey-overlay-title="Open Screen Time"                                       { spawn-sh "noctalia msg panel-toggle control-center screen-time"; }

    // ###################################################################################################################
    // Noctalia
    // ###################################################################################################################

      Mod+X        hotkey-overlay-title="Mute Microphone"   repeat=false     { spawn-sh "noctalia msg mic-mute"; }
      Mod+Ctrl+Z   hotkey-overlay-title="Toggle Do Not Disturb Mode"         { spawn-sh "noctalia msg notification-dnd-toggle"; }
      Mod+Ctrl+X   hotkey-overlay-title="Dismiss Notifications"              { spawn-sh "noctalia msg notification-clear-active"; }

      Mod+Ctrl+G   hotkey-overlay-title="Open Clipboard"                     { spawn-sh "noctalia msg panel-toggle clipboard"; }
      Mod+P        hotkey-overlay-title="Open Session Manager"               { spawn-sh "noctalia msg panel-toggle session"; }
      Mod+Ctrl+T   hotkey-overlay-title="Toggle Caffeine"                    { spawn-sh "noctalia msg caffeine-toggle"; }
      Mod+Ctrl+W   hotkey-overlay-title="Toggle Bluetooth"                   { spawn-sh "noctalia msg bluetooth-toggle"; }
      Mod+Ctrl+N   hotkey-overlay-title="Toggle Night Light"                 { spawn-sh "noctalia msg nightlight-toggle"; }

      Mod+Ctrl+O   hotkey-overlay-title="Keyboard Backlight: Off"            { spawn-sh "noctalia msg keyboard-backlight-set 0"; }
      Mod+Ctrl+D   hotkey-overlay-title="Keyboard Backlight: Dim"            { spawn-sh "noctalia msg keyboard-backlight-set 50"; }
      Mod+Ctrl+B   hotkey-overlay-title="Keyboard Backlight: Bright"         { spawn-sh "noctalia msg keyboard-backlight-set 100"; }

      Mod+Alt+Z    hotkey-overlay-title="Open Control Center"                { spawn-sh "noctalia msg panel-toggle control-center"; }
      Mod+Alt+M    hotkey-overlay-title="Open Media"                         { spawn-sh "noctalia msg panel-toggle control-center media"; }
      Mod+Alt+S    hotkey-overlay-title="Open System Monitor"                { spawn-sh "noctalia msg panel-toggle control-center system"; }
      Mod+Alt+P    hotkey-overlay-title="Open Power Monitor"                 { spawn-sh "noctalia msg panel-toggle control-center power"; }
      Mod+Alt+W    hotkey-overlay-title="Open Weather"                       { spawn-sh "noctalia msg panel-toggle control-center weather"; }
      Mod+Alt+C    hotkey-overlay-title="Open Calendar"                      { spawn-sh "noctalia msg panel-toggle control-center calendar"; }

    // ###################################################################################################################
    // Apps
    // ###################################################################################################################

      Mod+Shift+V   hotkey-overlay-title="Open Proxy Client: Clash Verge"     { spawn "clash-verge"; }
      Mod+E         hotkey-overlay-title="Open Browser: Zen"                  { spawn "zen"; }
      Mod+B         hotkey-overlay-title="Open Browser: Brave Origin"         { spawn "brave-origin"; }
      Mod+A         hotkey-overlay-title="Open File Manager: Nemo"            { spawn "nemo"; }
      Mod+Shift+E   hotkey-overlay-title="Open File Manager: Yazi"            { spawn-sh "kitty --class yazi yazi"; }
      Mod+N         hotkey-overlay-title="Open Code Editor: LazyVim"          { spawn-sh "kitty --class lazyvim nvim"; }
      Mod+Shift+N   hotkey-overlay-title="Open Code Editor: VSCodium"         { spawn "codium"; }

      Mod+Z         hotkey-overlay-title="Open Vesktop"                       { spawn "vesktop"; }
      Mod+T         hotkey-overlay-title="Open Telegram Desktop"              { spawn "Telegram"; }
      Mod+Shift+B   hotkey-overlay-title="Open Music Player: Pear Desktop"    { spawn "pear-desktop"; }
      Mod+Y         hotkey-overlay-title="Open Steam"                         { spawn "steam"; }
      Mod+G         hotkey-overlay-title="Open FreesmLauncher"                { spawn "freesmlauncher"; }
    }
  '';
}
