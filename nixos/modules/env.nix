{
  environment.sessionVariables = {
  __NV_DISABLE_EXPLICIT_SYNC = "1";
  QSG_RHI_BACKEND = "vulkan";
  };
  environment.etc."profile.d/clash-verge".text = ''
    export WEBKIT_DISABLE_COMPOSITING_MODE=1
  '';
}