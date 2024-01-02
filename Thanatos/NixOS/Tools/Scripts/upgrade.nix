{ inputs, outputs, lib, config, pkgs, ... }: {

  environment.etc."upgrade.nix" = {
    target = "scripts/upgrade.sh";
    text = ''
      #!/bin/sh

      git add .
      sudo nix flake update
      sudo nixos-rebuild switch --flake .#$HOSTNAME --upgrade
      sudo nix-collect-garbage --delete-old
      sudo nixos-rebuild switch --flake .#$HOSTNAME
      git commit -m "Upgrading $HOSTNAME $NIXOS_GENERATION"
      git commit -m "$HOSTNAME Upgraded and Rebuilt: $NIXOS_GENERATION"
      git push
    '';
  };
}
