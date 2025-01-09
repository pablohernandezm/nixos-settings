{ pkgs, config, lib, ... }:

{

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [
    ./programs
    ./settings
  ];

  home.activation = {
    directlink = lib.hm.dag.entryAfter [ "writeBoundary" ] (
      ''
        if [[ ! -e  ~/.config/nvim ]]; then
          run mkdir ~/.config/nvim
          run ${pkgs.git}/bin/git clone https://github.com/pablohernandezm/dot-nvim ~/.config/nvim
        fi
      ''
    );
  };

  programs.home-manager.enable = true;
}
