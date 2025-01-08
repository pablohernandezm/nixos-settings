{ pkgs, config, lib, ... }:

{
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.sessionVariables = {
    EDITOR = "nvim";
  };

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

  home.packages = with pkgs; [
    gh
    ghostty
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.rose-pine-cursor;
    name = "Rose Pine";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
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
