{ config, lib, pkgs, modulesPath, ... }: {

  programs.firefox.package = pkgs.firefox.override {
    cfg = {
      enableTridactylNative = true;
    };
    extraPolicies = {
      AppAutoUpdate = true;
      PromptForDownloadLocation = false;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFirefoxAccounts = false;
      NoDefaultBookmarks = true;
      DisableMasterPasswordCreation = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      EnableTrackingProtection.Value = true;
      Homepage.URL = "https://en.wikipedia.org/wiki/Special:Random";
      StartPage = "homepage";
      SearchSuggestEnable = false;
      ShowHomeButton = false;
      NewTabPage = false;
      Cookies = {
        Default = true;
        AcceptThirdParty = "always";
        ExpireAtSessionEnd = true;
        RejectTracker = true;
      };
      SanitizeOnShutdown = {
        Cache = true;
        Cookies = true;
        Downloads = true;
        FormData = true;
        History = true;
        Sessions = true;
        SiteSettings = true;
        OfflineApps = true;
        Locked = true;
      };
      FirefoxHome = {
        Search = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
      };
      FirefoxSuggests = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
        WhatsNew = false;
        FeatureRecomendations = false;
        UrlbarInterventions = false;
        MoreFromMozilla = false;
      };
    };
  };
}
