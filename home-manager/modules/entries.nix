{ config, pkgs, ... }: {
  xdg.dataFile = {
    "icons/lazyvim.svg".source = ../../pictures/lazyvim.svg;
  };

  xdg.desktopEntries = {
    kew = {
      name = "kew";
      genericName = "Music Player";
      comment = "Music for the Shell";
      exec = "kitty --class kew kew %F";
      icon = "kew";
      categories = [ "Audio" "Music" "Player" "AudioVideo" "ConsoleOnly" ];
    };
    nvim = {
      name = "LazyVim";
      genericName = "Text Editor";
      comment = "Neovim config for the lazy";
      exec = "kitty --class lazyvim nvim %F";
      icon = "${config.xdg.dataHome}/icons/lazyvim.svg";
      terminal = false;
      categories = [ "Development" "TextEditor" ];
      mimeType = [
        "text/english"
        "text/plain"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-java"
        "text/x-moc"
        "text/x-pascal"
        "text/x-tcl"
        "text/x-tex"
        "application/x-shellscript"
        "text/x-c"
        "text/x-c++"
      ];
    };
    yazi = {
      name = "Yazi File Manager";
      icon = "yazi";
      comment = "Blazing fast terminal file manager written in Rust, based on async I/O";
      terminal = false;
      exec = "kitty --class yazi yazi %f";
      type = "Application";
      mimeType = [ "inode/directory" ];
      categories = [ "System" "FileManager" "FileTools" "ConsoleOnly" ];
    };
  };
}
