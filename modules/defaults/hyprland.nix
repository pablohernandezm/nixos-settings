{ pkgs, inputs, ... }:
{
  programs.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # withUWSM = true;
  };

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  #   # systemd.enable = false;
  # };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    kitty # required for default config
    sway
  ];


  services.xserver = {
    enable = true;

    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };

    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };

    videoDrivers = [
      "amdgpu"
    ];
  };

  services.displayManager.sessionPackages = [ pkgs.sway ];

  services.libinput.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
