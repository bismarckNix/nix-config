{ inputs, pkgs, ... }: {
  imports = [ inputs.lazyvim.homeManagerModules.default ];

  programs.lazyvim = {
    enable = true;

    configFiles = ./nvim-config;

    extras = {
      lang = {
        nix.enable = true;
        python = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = true;
        };
        go = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = true;
        };
        rust = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = true;
        };
        markdown = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = true;
        };
      };

      ui.treesitter-context.enable = true;
      dap.core.enable = true;
      test.core.enable = true;
    };

    extraPackages = with pkgs; [ curl nixd alejandra statix ];

    treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
      git_config
      gitcommit
      git_rebase
      gitignore
      gitattributes
      json5
    ];

    plugins = {
      cord = ''
        return {
          { "vyfor/cord.nvim",
            build = ":Cord update",
            config = function()
              require("cord").setup({
                editor = {
                  client = 'lazyvim',
                },
                display = {
                  theme = 'minecraft',
                }
              })
            end
          }
        }
      '';

      diffview = ''
        return {
          {
            "sindrets/diffview.nvim",
            cmd = {
              "DiffviewOpen",
              "DiffviewFileHistory",
            },
            dependencies = {
              "nvim-lua/plenary.nvim",
            },
            keys = {
              {
                "<leader>gD",
                "<cmd>DiffviewOpen<cr>",
                desc = "Open Diffview",
              },
              {
                "<leader>gH",
                "<cmd>DiffviewFileHistory %<cr>",
                desc = "File History",
              },
            },
          },
        }
      '';

      image = ''
        return {
          { "3rd/image.nvim",
            build = false,
            opts = {
              processor = "magick_cli",
            }
          }
        }
      '';

      oil = ''
        return {
          {
            "stevearc/oil.nvim",
            lazy = false,
            dependencies = {
              { "nvim-mini/mini.icons", opts = {} },
            },
            opts = {
              view_options = {
                show_hidden = true,
              },
            },
            keys = {
              {
                "-",
                "<cmd>Oil<cr>",
                desc = "Open parent directory",
              },
            },
          },
        }
      '';
    };
  };
}
