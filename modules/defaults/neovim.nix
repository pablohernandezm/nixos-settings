{ inputs, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    neovim
  ];

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;

        theme = {
          enable = true;
          name = "rose-pine";
          style = "main";
        };

        telescope.enable = true;

        autocomplete.nvim-cmp.enable = true;
        assistant.copilot ={
          enable = true;
          cmp.enable = true;
        };

        languages = {
          enableTreesitter = true;

          nix.enable = true;
        };

        keymaps = [
          {
            key = "<leader>bd";
            mode = "n";
            action = "<CMD>bd<CR>";
          }
          {
            key = "<leader>q";
            mode = "n";
            action = "<CMD>q<CR>";
          }
          {
            key = "<leader>Q";
            mode = "n";
            action = "<CMD>q!<CR>";
          }
          {
            key = "<leader>w";
            mode = "n";
            action = "<CMD>w<CR>";
          }
          {
            key = "<S-h>";
            mode = "n";
            action = "<CMD>bprev<CR>";
          }
          {
            key = "<S-l>";
            mode = "n";
            action = "<CMD>bnext<CR>";
          }
          {
            key = "<leader>tf";
            mode = "n";
            action = "<CMD>Telescope find_files<CR>";
          }
          {
            key = "<leader>e";
            mode = "n";
            action = "<CMD>Neotree position=current<CR>";
          }
        ];

      };
    };
  };
}
