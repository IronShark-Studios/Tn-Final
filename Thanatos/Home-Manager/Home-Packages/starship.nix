{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      success_symbol = "❯(bold blue)";
    };
  };
}
