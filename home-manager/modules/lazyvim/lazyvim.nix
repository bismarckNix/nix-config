{ inputs, pkgs, ... }: {
  imports = [ inputs.lazyvim.homeManagerModules.default ];

  programs.lazyvim = {
    enable = true;

    configFiles = ./nvim-config;

    extras = {
      lang.nix.enable = true;
      lang.python = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };
      lang.go = {
        enable = true;
        installDependencies = true;
        installRuntimeDependencies = true;
      };
    };

    extraPackages = with pkgs; [ curl nixd alejandra ];

    plugins.cord = ''
      return {
        { "vyfor/cord.nvim",
          build = ":Cord update",
          config = function()
            require("cord").setup({
              timer = { enable = true, interval = 1500 },
              display = {
                show_time = true,
                show_repository = true,
                show_cursor_position = true,
              },
            })
          end
        }
      }
    '';
  };
}