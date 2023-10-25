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

    syntaxHighlighting = {
      enable = true;
      styles = {
        comment = "fg=#81A8BA,underline";
        constant = "fg=#9DAFAE,bold";
        entity = "fg=#C0B0CA,italic";
        function = "fg=#36B8EE";
        alias = "fg=#E89C22";
        suffix-alias = "fg=#E89C22,bold";
        global-alias = "fg=#E89C22,bold";
        builtin = "fg=#AD62A7";
        reserved-word = "fg=#9DAFAE,bold";
        hashed-command = "fg=#9DAFAE";
        path = "fg=#384551";
        globbing = "fg=#688094";
        history-expansion = "fg=#688094";
        single-hyphen-option = "fg=#9DAFAE,bold";
        double-hyphen-option = "fg=#9DAFAE,bold";
        back-quoted-argument = "fg=#384551";
        single-quoted-argument = "fg=#384551";
        double-quoted-argument = "fg=#384551";
        dollar-double-quoted-argument = "fg=#384551";
        back-double-quoted-argument = "fg=#384551";
        assign = "fg=#FABD3A";
        precommand = "fg=#384551,italic";
        autodirectory = "fg=#384551,bold";
        commandseparator = "fg=#384551,bold";
        command-substitution-delimiter = "fg=#384551,bold";
        command-substitution-delimiter-unquoted = "fg=#384551";
        unknown-token = "fg=#F6A4C5";
      };
    };
  };

  home.packages = with pkgs; [
    ranger
    vim
  ];

}
