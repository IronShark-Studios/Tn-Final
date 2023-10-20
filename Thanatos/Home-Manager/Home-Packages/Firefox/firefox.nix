{ inputs, outputs, lib, config, pkgs, ... }: {

  programs.firefox = {
    enable = true;
    profiles.xin = {
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
                '';
    };
  };
}
