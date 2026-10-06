# Repository guidance

## Configuration wiring
- The sole flake target is `nixosConfigurations.homeWorkstation` (`x86_64-linux`); the machine's hostname is `nixos`, so use the explicit flake target in rebuild commands.
- `flake.nix` loads `hosts/home-workstation/configuration.nix` and the Home Manager NixOS module. That host config loads `home.nix` for user `janek`; Home Manager changes are applied through the NixOS rebuild, with no standalone `homeConfigurations` output.
- Modules are activated through explicit imports. In `hosts/home-workstation/home.nix`, the `zsh.nix` and `vscode.nix` imports are commented out; editing those modules alone has no effect.
- Nixpkgs tracks `nixos-unstable`; Home Manager follows the same nixpkgs input. Keep `system.stateVersion` and `home.stateVersion` at `25.05` during dependency updates unless intentionally migrating state compatibility.
- `hosts/home-workstation/hardware-configuration.nix` is generated and contains machine-specific disks; put ordinary system changes in `configuration.nix` or imported modules.

## Commands (repository root)
- Evaluate the system derivation without building: `nix eval --raw .#nixosConfigurations.homeWorkstation.config.system.build.toplevel.drvPath`.
- Build without activating: `nix build .#nixosConfigurations.homeWorkstation.config.system.build.toplevel --no-link`.
- Apply the system and Home Manager configuration: `sudo nixos-rebuild switch --flake .#homeWorkstation`.
- Update pinned inputs: `nix flake update` (changes `flake.lock`).
- There is no configured test suite, formatter, or flake `checks` output; use system evaluation/build for Nix changes.
- New files referenced by Nix must be Git-tracked for the Git-backed flake to include them.

## Desktop and local prerequisites
- `modules/home-manager/hyprland.nix` loads the wallpaper from `~/.dotfiles/theme/forrest.jpg` and executes `/home/janek/.dotfiles/theme/start.sh`. These are live checkout paths, not Home Manager-installed assets; moving the checkout requires updating them.
- `theme/start.sh` launches the Quickshell/PipeWire volume OSD in `theme/volume.qml`. Run `bash theme/start.sh` in the desktop session to exercise it; shell syntax alone can be checked with `bash -n theme/start.sh`.
- WireGuard requires the external `/etc/nixos/wireguard/wg0.conf`; the README documents starting it with `sudo systemctl start wg-quick-wg0.service`.
