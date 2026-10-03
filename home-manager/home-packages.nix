{ inputs, pkgs, ... }: let
  lmmx3 = pkgs.fetchFromGitHub {
    owner = "Yulljie";
    repo = "LMMX3";
    rev = "584ffda";
    hash = "sha256-01xKuMAPGJjQ+iWfIn7XxP2ioRLLk+cbOSn8pNScjow";
  };
  soundfonts = pkgs.symlinkJoin {
    name = "soundfonts";
    paths = with pkgs; [
      soundfont-generaluser-gs
      soundfont-fluid
      soundfont-arachno
    ];
  }; in {
  home.packages = with pkgs; [

    # Terminal stuff
    asciiquarium
    cmatrix
    lavat
    microfetch
    pipes
    tty-clock
    unimatrix
    inputs.areofyl-fetch.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Files
    (nemo-with-extensions.override {
      extensions = with pkgs; [ nemo-seahorse ];
    })
    udiskie
    xarchiver

    # Browsers
    brave-origin
    tor-browser
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Messengers
    discordo
    telegram-desktop

    # Work
    ardour
    darktable
    gimp3
    (pkgs.symlinkJoin {
      name = "krita-wayland";
      paths = [ pkgs.krita ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/krita \
          --set-default QT_QPA_PLATFORM wayland
      '';
    })
    inkscape
    kdePackages.kdenlive
    libreoffice
    lmms-full
    obsidian
    python3
    rustup
    uv
    vlc
    vscodium

    # Utilities
    _7zz-rar
    bc
    brightnessctl
    cacert
    ddcutil
    ffmpeg
    fd
    gcc
    ghgrab
    gpu-screen-recorder
    grim
    hyprpicker
    imagemagick
    jq
    kdePackages.qt6ct
    loupe
    mpvpaper
    pastel
    pciutils
    poppler-utils
    resvg
    ripgrep
    slurp
    sshfs
    tealdeer
    translate-shell
    wget
    wl-clipboard
    wl-screenrec
    xwayland-satellite
    zbar

    # Plugins
    helm
    lsp-plugins
    sfizz
    surge-xt
    x42-plugins
    zynaddsubfx

    # Other
    catppuccin-gtk
    keepassxc
    pear-desktop
    polkit
    sbctl
    smassh
    system-config-printer

  ];

  nixpkgs.overlays = [
    (final: prev: {
      lmms = prev.lmms.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          rm -rf $out/share/lmms/themes/default
          cp -r ${lmmx3}/LMMX3 $out/share/lmms/themes/default
        '';
      });
    })
  ];

  home.file."Projects/lmms/samples/soundfonts".source = "${soundfonts}/share/soundfonts";
}
