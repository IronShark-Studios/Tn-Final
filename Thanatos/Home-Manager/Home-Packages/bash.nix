{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.bash = {
    enable = true;

    shellAliases = {
      lx = "ls -la";
      rma = "rm -rf";
      power-off = "sudo shutdown -h now";
      logout = "sudo kill -9 -1";
      restart = "sudo reboot";
      eo = "emacsclient -n";
      seo = ''sudo emacsclient -n'';
      rebuild = "bash /etc/scripts/rebuild.sh";
      upgrade = "bash /etc/scripts/upgrade.sh";
      clean = "sudo nix-collect-garbage --delete-old && rebuild";
      clipboard = "xclip -selection clipboard";
    };

    sessionVariables = {
      NIXOS_GENERATION = (nix-env --list-generations | tail -n 1 | sed '/s(current)//');
    };

    profileExtra = ''
      emacs
    '';
  };
}
