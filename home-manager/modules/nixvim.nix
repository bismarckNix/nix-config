{ config, pkgs, inputs, ... }: {
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;

    extraPackages = with pkgs; [
      lua-language-server
      stylua
      ripgrep
      fd
    ];

    extraPlugins = with pkgs.vimPlugins; [
      lazy-nvim
      vim-nix
    ];

    extraConfigLua =
      let
        plugins = with pkgs.vimPlugins; [
          LazyVim
          bufferline-nvim
          conform-nvim
          flash-nvim
          friendly-snippets
          gitsigns-nvim
          lualine-nvim
          neo-tree-nvim
          noice-nvim
          nui-nvim
          nvim-lint
          nvim-lspconfig
          nvim-treesitter
          nvim-treesitter-textobjects
          nvim-ts-autotag
          persistence-nvim
          plenary-nvim
          snacks-nvim
          telescope-fzf-native-nvim
          telescope-nvim
          todo-comments-nvim
          tokyonight-nvim
          trouble-nvim
          which-key-nvim
          { name = "catppuccin"; path = catppuccin-nvim; }
          { name = "mini.ai"; path = mini-nvim; }
          { name = "mini.icons"; path = mini-nvim; }
          { name = "mini.pairs"; path = mini-nvim; }
        ];
        mkEntry = drv:
          if pkgs.lib.isDerivation drv then
            { name = "${pkgs.lib.getName drv}"; path = drv; }
          else drv;
        lazyPath = pkgs.linkFarm "lazy-plugins" (pkgs.lib.map mkEntry plugins);
      in
      ''
        require("lazy").setup({
          defaults = { lazy = true },
          dev = {
            path = "${lazyPath}",
            patterns = { "" },
            fallback = true,
          },
          spec = {
            { "LazyVim/LazyVim", import = "lazyvim.plugins" },
            { "mason-org/mason-lspconfig.nvim", enabled = false },
            { "mason-org/mason.nvim", enabled = false },
            { "nvim-treesitter/nvim-treesitter", opts = function(_, opts) opts.ensure_installed = {} end },
          },
        })
      '';
  };

  xdg.configFile."nvim/lua".source = ./lua;

  xdg.configFile."nvim/parser".source =
    let
      parsers = pkgs.symlinkJoin {
        name = "treesitter-parsers";
        paths = (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
          lua nix bash python
        ])).dependencies;
      };
    in "${parsers}/parser";
}