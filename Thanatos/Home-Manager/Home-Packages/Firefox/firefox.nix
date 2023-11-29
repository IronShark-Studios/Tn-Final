{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.firefox = {
    enable = true;
    profiles.Xin = {
      isDefault = true;
      extraConfig = ''
                    user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
                    user_pref("full-screen-api.ignore-widgets", true);
                    user_pref("media.ffmpeg.vaapi.enabled", true);
                    user_pref("media.rdd-vpx.enabled", true);
                    user_pref("general.smoothScroll", true);
                    user_pref("extensions.formautofill.addresses.enabled", false);
                    user_pref("extensions.formautofill.creditCards.enabled", false);
                    user_pref("browser.tabs.closeWindowWithLastTab", false);
                    user_pref("layers.acceleration.force-enabled", true);
                    user_pref("browser.link.open_newwindow", 3);
                    user_pref("font.name.monospace.x-western", Iosevka Nerd Font Mono);
                    user_pref("font.name.sans-serif.x-western", IosevkaTerm Nerd Font Propo);
                    user_pref("font.name.serif.x-western", Iosevka Nerd Font);
                    user_pref("font.size.monospace.x-western", 18);
                    user_pref("font.size.variable.x-western", 18);
                '';
    };
  };
}
