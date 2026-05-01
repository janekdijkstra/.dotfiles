```sudo nixos-rebuild switch --flake .#homeWorkstation```

# Updating

```nix flake update```

# Setup Steps

## Wireguard

- create `/etc/nixos/wireguard/wg0.conf`
- run `sudo systemctl start wg-quick-wg0.service`