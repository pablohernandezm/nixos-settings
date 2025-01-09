{ pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };

    cursorTheme = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
    };

    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
}
