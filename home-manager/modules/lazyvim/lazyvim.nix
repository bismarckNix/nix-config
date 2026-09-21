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
      };
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
    };
  };
}
