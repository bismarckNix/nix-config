{
  xdg.configFile."niri/cfg/startup.kdl".text = ''
    spawn-at-startup "env" "QT_QPA_PLATFORMTHEME=qt6ct" "noctalia"
  '';
}