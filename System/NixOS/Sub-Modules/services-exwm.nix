{ inputs, outputs, lib, config, pkgs, ... }: {

#   services.xserver.windowManager.exwm = {
#    enable = true;
#    enableDefaultConfig = false;
#    extraPackages = epkgs: with epkgs; [
#      use-package
#      exwm
#      burly
#      helm
#      helm-projectile
#      emojify
#      all-the-icons
#      ligature
#      centered-cursor-mode
#      rainbow-delimiters
#      smartparens
#      doom-modeline
#      doom-themes
#      evil
#      evil-snipe
#      evil-easymotion
#      evil-collection
#      evil-colemak-basics
#      helpful
#      which-key
#      undo-tree
#      dmenu
#      magit
#      git-gutter
#      projectile
#      ag
#      rg
#      nix-mode
#      org-bullets
#      org-appear
#      org
#      ox-hugo
#      visual-fill-column
#      aggressive-indent
#    ];
#  };
}
