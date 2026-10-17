{ inputs, ... }: {
  imports = [ inputs.nuclear.homeModules.default ];
  
  programs.nuclear = {
    enable = true;
  };
}
