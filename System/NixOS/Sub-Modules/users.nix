{ config, lib, pkgs, modulesPath, ... }: {

  environment.etc.secrets.source = ./Tools/Secrets;

  environment.etc.scripts.source = ./Tools/Scripts;

  security = {
    sudo.wheelNeedsPassword = false;
    rtkit.enable = true;
  };

  users = {
    mutableUsers = false;
    users = {
      root = {
        passwordFile = "/etc/secrets/root/root-usrPasswd.nix";
      };

      Que = {
        isNormalUser = true;
        openssh.authorizedKeys.keys = [ ];
        extraGroups = [ "wheel" ];
        passwordFile = "/etc/secrets/que/que-usrPasswd.nix";
      };
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      Que = import ../Home-Manager/que-home.nix;
    };
  };
}
