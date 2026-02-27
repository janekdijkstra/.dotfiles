```sudo nixos-rebuild switch --flake .#homeWorkstation```


# Setup Steps

## Wireguard

- create `/etc/nixos/wireguard/wg0.conf`
- run `sudo systemctl start wg-quick-wg0.service`