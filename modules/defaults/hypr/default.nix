{ pkgs, inputs, ... }:
{
  imports = [
    ./hyprcursor.nix
    ./hyprpolkitagent.nix
  ];

  environment.systemPackages = with pkgs; [
    uwsm
    kitty # required for default config
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
    };
  };

  environment.variables = {
    UWSM_USE_SESSION_SLICE = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };


  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
