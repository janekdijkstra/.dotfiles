{ pkgs, ... }:

{
  imports = [
    ./1password.nix
    ./docker.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Nautilus audio/video properties outside GNOME.
  nixpkgs.overlays = [
    (final: prev: {
      nautilus = prev.nautilus.overrideAttrs (nprev: {
        buildInputs = nprev.buildInputs ++ (with final.gst_all_1; [
          gst-plugins-good
          gst-plugins-bad
        ]);
      });
    })
  ];

  # Trash, network filesystems, and removable drives for Nautilus.
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Make HEIC thumbnailers available to Nautilus.
  environment.pathsToLink = [ "share/thumbnailers" ];

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
    nautilus
    libheif
    libheif.out
  ];
}
