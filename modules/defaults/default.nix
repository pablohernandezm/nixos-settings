{ inputs, pkgs, ... }:
{
  imports = [
    ./neovim.nix
    ./hyprland
    ./brave.nix
    ./wl-clipboard.nix
    ./mako.nix
    ./waybar.nix
    ./pipewire.nix
    ./hyprpolkitagent.nix
    ./rofi-wayland.nix
    ./nautilus.nix
  ];
}
