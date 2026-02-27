{ pkgs, lib, ...}:

{
nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "1password"
           ];

  programs.git = {
    enable = true;
    
    settings = {
      user = {
        name  = "Janek Dijkstra";
        email = "janek@foolsparadise.de";
        push = { autoSetupRemote = true; };
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJp3l76NmwZv/0XS9Wfu8WCNDPHQtDwh9823Rbtqnmmm";
      };

      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };
      
      init.defaultBranch = "main";
    };
  };
}
