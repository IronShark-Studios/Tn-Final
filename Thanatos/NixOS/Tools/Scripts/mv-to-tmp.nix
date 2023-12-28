{ inputs, outputs, lib, config, pkgs, ... }: {

  environment.etc."mv-to-tmp.nix" = {
    target = "scripts/mv-to-tmp.sh";
    text = ''
      #!/bin/sh

      move_to_tmp()
        { mv "$1" /tmp }
    '';
  };
}
