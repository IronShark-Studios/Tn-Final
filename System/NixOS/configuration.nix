{ inputs, outputs, lib, config, pkgs, ... }: {

  system.stateVersion = "23.05";

  imports = [
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.static-nxpkgs
      outputs.overlays.static-hmpkgs
    ];

    config = {
      allowUnfree = true;
    };
  };

    hostPlatform = lib.mkDefault "x86_64-linux";
  };

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  networking.hostName = "Voyager";

  boot.loader.systemd-boot.enable = true;

  users.users = {
    Que = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ ];
      extraGroups = [ "wheel" ];
    };
  };

  services.openssh = {
    enable = false;
    permitRootLogin = "no";
    passwordAuthentication = false;
  };
}
