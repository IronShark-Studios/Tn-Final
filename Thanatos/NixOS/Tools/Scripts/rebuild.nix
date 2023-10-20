{ inputs, outputs, lib, config, pkgs, ... }: {

  environment.etc."rebuild.nix" = {
    target = "scripts/rebuild.sh";
    text = ''
      #!/bin/sh

      git add .
      sudo nixos-rebuild switch --flake .#$HOSTNAME
      git commit -m "$HOSTNAME Rebuilt: $NIXOS_GENERATION"
      git push
    '';
  };
}
