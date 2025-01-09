{ pkgs, config, lib, ... }:

{

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [ ./theme.nix ];

  home.packages = with pkgs; [
    gh
    ghostty
  ];

  programs.git = {
    enable = true;

    userName = "pablohernandezm";
    userEmail = "phernandezm07@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
        diff-so-fancy = true;
        navigate = true;
      };
    };
  };

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
