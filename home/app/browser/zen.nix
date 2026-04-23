{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.home.app.browser.zen;
in {
  imports = [
    inputs.zen.homeModules.beta
  ];

  options.home.app.browser.zen = {
    enable = mkEnableOption "Enable zen configuration";
  };

  config = mkIf cfg.enable {
    stylix.targets.zen-browser.profileNames = [ "default" ];
    programs.zen-browser = {
      enable = true;
      nativeMessagingHosts = [pkgs.firefoxpwa];
      suppressXdgMigrationWarning = true;

      policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };

      profiles.default = {
        settings = {
          "browser.sessionstore.resume_from_crash" = false;
          "browser.startup.page" = 1;
          "zen.urlbar.replace-newtab" = true;
          "browser.startup.homepage" = "http://dashboard.home";
        };

        extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
          bitwarden
          sponsorblock
          istilldontcareaboutcookies
          buster-captcha-solver
          decentraleyes
          return-youtube-dislikes
          indie-wiki-buddy
          clearurls
          dont-track-me-google1
        ];

        mods = [
          "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe"
        ];

        search = {
          force = true;
          default = "google";

          engines = {
            mynixos = {
              name = "nix-pkgs";
              urls = [
                {
                  template = "https://search.nixos.org/packages?query={searchTerms}";
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@nx"];
            };
          };
        };
      };
    };
  };
}
