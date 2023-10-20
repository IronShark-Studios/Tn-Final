{ inputs, outputs, lib, config, pkgs, ... }: {

  environment.etc."upgrade.nix" = {
    target = "scripts/upgrade.sh";
    text = ''
      #!/bin/sh

      git add .
      git commit -m "Upgrading $HOSTNAME $NIXOS_GENERATION"
      sudo nix flake update
      sudo nixos-rebuild switch --flake .#$HOSTNAME --upgrade &&
      git commit -m "$HOSTNAME Rebuilt: $NIXOS_GENERATION"
      git push
    '';
  };
}
