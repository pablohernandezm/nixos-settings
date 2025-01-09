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


  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };


  # environment.shellInit = ''
  #   if uwsm check may-start; then
  #     exec uwsm start hyprland.desktop
  #   fi  
  # '';

  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
    };
  };

  # services.displayManager.sddm.wayland = true;
  # services.xserver = {
  #   enable = true;
  #
  #   displayManager = {
  #     gdm = {
  #       enable = true;
  #       wayland = true;
  #     };
  #   };
  #
  #   videoDrivers = [
  #     "amdgpu"
  #   ];
  # };

  # services.displayManager.sessionPackages = [ pkgs.hyprland ];

  # services.libinput.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
