{ inputs, outputs, lib, config, pkgs, ... }: {

  environment.etc."rebuild.nix" = {
    target = "scripts/rebuild.sh";
    text = ''
      #!/bin/sh

      git status &&
      echo -n \"Commit Message: \" &&
      read -r commitMessage &&
      git add . &&
      sudo nixos-rebuild switch --flake .#$HOSTNAME &&
      git commit -m \"$HOSTNAME Rebuilt: $NIXOS_GENERATION $commitMessage\" &&
      git push &&
      echo
      echo System Generation $NIXOS_GENERATION Active.
    '';
  };
}
