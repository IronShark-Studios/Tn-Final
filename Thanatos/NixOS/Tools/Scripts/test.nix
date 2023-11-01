{ inputs, outputs, lib, config, pkgs, ... }: {

  environment.etc."test.nix" = {
    target = "scripts/test.sh";
    text = ''
      #!/bin/sh

      sudo nixos-rebuild test --flake .#$HOSTNAME &&
      echo
      echo System Generation Temporarily $NIXOS_GENERATION Active.
    '';
  };
}
