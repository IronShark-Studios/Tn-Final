{ inputs, outputs, lib, config, pkgs, ... }: {

  environment.etc."rebuild.nix" = {
    target = "scripts/rebuild.sh";
    text = ''
      #!/bin/sh

      git add . &&
      git status &&
      echo -n Commit Message: &&
      read -r CommitMessage &&
      sudo nixos-rebuild switch --flake .#$HOSTNAME &&
      git commit -m "$HOST Rebuild: $NIXOS_GENERATION $CommitMessage" &&
      git push &&
      echo
      echo System Generation $NIXOS_GENERATION Active.
    '';
  };
}
