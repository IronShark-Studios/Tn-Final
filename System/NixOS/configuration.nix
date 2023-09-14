{ inputs, outputs, lib, config, pkgs, ... }: {

  system.stateVersion = "23.05";

  imports = [
    ./hardware-configuration.nix
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

  environment = {
    systemPackages = with pkgs; [
      # pulseaudio
      # pulseaudio-ctl
      # pulsemixer
      polybar
      networkmanagerapplet
      volctl
      lm_sensors
      pciutils
      fd
      silver-searcher
      wget
      unzip
      hunspell
      hunspellDicts.en_US-large
      slock
      flameshot
    ];

    lxqt.excludePackages = with pkgs.lxqt; [
      qterminal
    ];
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


      unclutter-xfixes.enable = true;

      cron = {
        enable = true;
        systemCronJobs = [
          "*/5 * * * *      root    date >> /tmp/cron.log"
        ];
      };

      xserver = {
        autorun = true;
        layout = "us";
        xkbVariant = "colemak_dh";
        xkbOptions = "caps:escape";

        desktopManager.lxqt.enable = true;

        displayManager = {
          sddm.enable = true;
          sddm.autoNumlock = true;
        };

        windowManager.exwm = {
          enable = true;
          enableDefaultConfig = false;
          extraPackages = epkgs: with epkgs; [
            use-package
            exwm
            burly
            helm
            helm-projectile
            emojify
            all-the-icons
            ligature
            centered-cursor-mode
            rainbow-delimiters
            smartparens
            doom-modeline
            doom-themes
            evil
            evil-snipe
            evil-easymotion
            evil-collection
            evil-colemak-basics
            helpful
            which-key
            undo-tree
            dmenu
            magit
            git-gutter
            projectile
            ag
            rg
            nix-mode
            org-bullets
            org-appear
            org
            ox-hugo
            visual-fill-column
            aggressive-indent
          ];
        };
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

  environment.etc.secrets.source = ../secrets;

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
  }
