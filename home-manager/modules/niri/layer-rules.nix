{
  xdg.configFile."niri/cfg/layer-rules.kdl".text = ''
    layer-rule {
      match namespace="^noctalia-backdrop"

      place-within-backdrop true
    }

    layer-rule {
      match namespace="^noctalia-bar"

      background-effect {
        blur false
      }
    }
  '';
}
