{ inputs, outputs, lib, config, pkgs, ... }: {

  system.stateVersion = "23.05";

  imports = [
    ./hardware-configuration.nix
    ./default-specialisation.nix
    ./guest-specialisation.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.static-nxpkgs
      outputs.overlays.static-hmpkgs
      inputs.emacs-community.overlay
    ];

    config = {
      allowUnfree = true;
      hostPlatform = lib.mkDefault "x86_64-linux";
    };
  };


  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  security = {
    sudo.wheelNeedsPassword = false;
    rtkit.enable = true;
  };

  networking = {
    hostName = "Voyager";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };

  services = {
    openssh = {
      enable = false;
      settings = {
        permitRootLogin = "no";
        passwordAuthentication = false;
      };
    };

    xserver = {
      enable = true;
      libinput.enable = true;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    printing.enable = true;

    picom.enable = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;

  time.timeZone = "America/Detroit";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  fonts.fonts = with pkgs; [
    nerdfonts
    iosevka
    overpass
    fira-code
    fira-go
  ];

  users.users = {
    Que = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ ];
      extraGroups = [ "wheel" ];
    };
  };
}
