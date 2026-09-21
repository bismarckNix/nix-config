{ config, pkgs, ... }: {
  xdg.dataFile."icons/lazyvim.svg".source = ../../pictures/lazyvim.svg;

  xdg.desktopEntries.nvim = {
    name = "LazyVim";
    genericName = "Text Editor";
    comment = "Neovim with LazyVim in Kitty";
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
}
