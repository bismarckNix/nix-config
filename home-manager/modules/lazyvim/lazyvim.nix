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
      };
    };

    extraPackages = with pkgs; [ curl nixd alejandra statix ];

    plugins.cord = ''
      return {
        { "vyfor/cord.nvim",
          build = ":Cord update",
          config = function()
            require("cord").setup({
              editor = {
                client = 'lazyvim',
              }
            })
          end
        }
      }
    '';
  };
}
