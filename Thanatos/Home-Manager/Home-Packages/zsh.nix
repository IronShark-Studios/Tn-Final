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

    history.ignoreAllDups = true;
    historySubstringSearch.enable = true;

    initExtra = ''
      autoload -Uz compinit && compinit
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      eval "$(starship init zsh)"
      emacs
    '';

    oh-my-zsh = {
      enable = true;
    };

    syntaxHighlighting = {
      enable = true;
      styles = {
        comment = "fg=#41505E,underline";
        constant = "fg=#D95468,bold";
        entity = "fg=#D98E48,italic";
        function = "fg=#8BD49C";
        alias = "fg=#33CED8";
        suffix-alias = "fg=#33CED8,bold";
        global-alias = "fg=#33CED8,bold";
        builtin = "fg=#EBBF83";
        reserved-word = "fg=#5EC4FF,bold";
        hashed-command = "fg=#539AFC";
        path = "fg=#718CA1";
        globbing = "fg=#E27E8D";
        history-expansion = "fg=#B62D65";
        single-hyphen-option = "fg=#70E1E8,bold";
        double-hyphen-option = "fg=#70E1E8,bold";
        back-quoted-argument = "fg=#008B94";
        single-quoted-argument = "fg=#008B94";
        double-quoted-argument = "fg=#008B94";
        dollar-double-quoted-argument = "fg=#008B94";
        back-double-quoted-argument = "fg=#008B94";
        assign = "fg=#D95468";
        precommand = "fg=#008B94,italic";
        autodirectory = "fg=#008B94,bold";
        commandseparator = "fg=#008B94,bold";
        command-substitution-delimiter = "fg=#008B94,bold";
        command-substitution-delimiter-unquoted = "fg=#008B94";
        unknown-token = "fg=#539AFC";
      };
    };
  };

  home.packages = with pkgs; [
    lf
    vim
    starship
    htop
    nmon
    neofetch
    fortune
  ];

}
