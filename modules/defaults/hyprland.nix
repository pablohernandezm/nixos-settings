{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    kitty # required for default config
    sway
  ];

  hardware.graphics.enable = true;

  services.xserver = {
    enable = true;

    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };

    };
  };

  services.displayManager.sessionPackages = [ pkgs.sway ];

  services.libinput.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
