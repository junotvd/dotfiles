{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    # sensible defaults to prove it works
    globals.mapleader = " ";
    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      ignorecase = true;
      smartcase = true;
      termguicolors = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>w<cr>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>q";
        action = "<cmd>q<cr>";
        options.silent = true;
      }
    ];

    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
    };
  };
}
