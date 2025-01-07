{ pkgs, ... }:

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
      merge.conflictstyle =  "diff3";
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

  home.packages = [
    pkgs.gh
  ];

  programs.home-manager.enable = true;
}
