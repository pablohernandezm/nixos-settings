{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pipewire
  ];

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };
}
