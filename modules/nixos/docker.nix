{ lib, pkgs, ... }:
{
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  users.users.janek.extraGroups = [ "docker" ];
}