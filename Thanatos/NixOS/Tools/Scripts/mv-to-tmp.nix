{ inputs, outputs, lib, config, pkgs, ... }: {

  environment.etc."mv-to-tmp.nix" = {
    target = "scripts/mv-to-tmp.sh";
    text = ''
      #!/bin/sh

      mv-to-tmp() {
        mv "$1" /tmp
      }

        mv-to-tmp "$1"
    '';
  };
}
