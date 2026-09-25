{
  environment.sessionVariables = {
    TERMINAL = "kitty";
    EDITOR = "nvim";
    __NV_DISABLE_EXPLICIT_SYNC = "1";
    QSG_RHI_BACKEND = "vulkan";
    LD_LIBRARY_PATH = "/run/opengl-driver/lib";
    GTK_USE_PORTAL = "1";
  };
  environment.etc."profile.d/clash-verge".text = ''
    export WEBKIT_DISABLE_COMPOSITING_MODE=1
  '';
}
