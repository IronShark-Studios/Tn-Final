{ inputs, outputs, lib, config, pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [
      blueman # GTK base bluetooth manager
      elementary-xfce-icon-theme
      gimp-with-plugins # Move into home-manager
      gnome.gnome-disk-utility # replace with Gparted in home-manager
      inkscape-with-extensions # Move into home-manager
      pavucontrol # Move into main config
      xclip # Move into main config
      xcolor # Move into main config with flakeshot
      xdo # Move into main config
      xdotool # Move into main config
      xsel # Move into main config
      xfce.xfce4-appfinder
      xfce.xfce4-genmon-plugin
      xfce.xfce4-panel
      xfce.xfce4-pulseaudio-plugin
      xfce.xfce4-whiskermenu-plugin
      xfce.xfce4-xkb-plugin
      xfce.xfdashboard
      xorg.xev
      sddm-chili-theme
    ];
  };

  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  security.pam.services.gdm.enableGnomeKeyring = true;

  services = {
    blueman.enable = true;
    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    xserver = {
      enable = true;
      libinput.enable = true;
      autorun = true;
      layout = "us";
      xkbVariant = "colemak_dh";
      xkbOptions = "caps:escape";
      excludePackages = with pkgs; [
        xterm
      ];

      displayManager = {
        defaultSession = "xfce+exwm";
        sddm = {
          enable = true;
          autoNumlock = true;
          theme = "chili";
          };
      };

      desktopManager.xfce = {
        enable = true;
        enableScreensaver = false;
     #   noDesktop = true;
     #   enableXfwm = false;
      };
    };

    unclutter-xfixes.enable = true;
    picom.enable = true;
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
  };
}
