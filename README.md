# configs

here they are IG

**use hosts/alfrid.nix as an example**

## Cleanup.sh

run with `bash cleanup.sh`

## Experemental

### To set up new host

1. Install nixos as you normally would.
2. run this

```
nix-shell -p git --run "bash <(curl -L https://raw.githubusercontent.com/quinm0/nixcfg/refs/heads/main/install.sh)"
```
