{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.zsh = {
    enable = true;

    shellAliases = {
      lx = "ls -la";
      ll = "ls -l";
      rma = "rm -rf";
      power-off = "sudo shutdown -h now";
      logout = "sudo kill -9 -1";
      restart = "sudo reboot";
      eo = "emacsclient -n";
      rebuild = "bash /etc/scripts/rebuild.sh";
      upgrade = "bash /etc/scripts/upgrade.sh";
      clean = "sudo nix-collect-garbage --delete-old && rebuild";
      cb = "xclip -selection clipboard";
    };

    sessionVariables = {
      SUDO_EDITOR = "\"emacsclient\"";
      NIXOS_GENERATION = "$(nix-env --list-generations | tail -n 1 | sed 's/(current)//')";
    };

    enableCompletion = true;

    autocd = true;

    enableAutosuggestions = true;

    syntaxHighlighting.enable = true;
  };

  home.packages = with pkgs; [
    ranger
    vim
  ];

}
