{ inputs, pkgs, ... }:
{
  imports = [
    ./hypr
    ./mako
    ./waybar
    ./pipewire
    ./wl-clipboard
    ./neovim
    ./rofi-wayland
    ./nautilus
    ./brave
  ];
}
