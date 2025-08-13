{ pkgs, lib, ...}:

{
  programs.zsh = {
    enable = true;
    
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"         # also requires `programs.git.enable = true;`
      ];
      theme = "robbyrussell";
    };    
  };
}
