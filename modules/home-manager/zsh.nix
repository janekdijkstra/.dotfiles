{ pkgs, lib, ...}:

{
  programs.zsh = {
    enable = true;
    shellAliases.ssh = "kitty +kitten ssh";
    
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"         # also requires `programs.git.enable = true;`
      ];
      theme = "robbyrussell";
    };    
  };
}
