{ pkgs, ... }:

{
  imports = [
    ./1password.nix
    ./docker.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    waybar.enable = true;
    thunderbird.enable = true;
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
    vim
    wget
    curl
  ];
}
