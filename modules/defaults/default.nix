{ inputs, pkgs, ...}:
{
  imports = [
    ./neovim.nix
    ./hyprland.nix
    ./brave.nix
    ./wl-clipboard.nix
  ];
}
