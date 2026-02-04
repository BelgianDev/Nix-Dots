{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.home.app.chat.discord;
in {
  options.home.app.chat.discord = {
    enable = mkEnableOption "Enable discord.";
  };

  config = mkIf cfg.enable {
    programs.vesktop = {
      enable = true;
      settings = {
        discordBranch = "stable";
        minimizeToTray = false;
        arRPC = true;

        customTitleBar = true;

        spellCheckLanguages = [
          "en-US"
          "en"
          "fr-fr"
          "fr"
        ];
      };

      vencord = {
        settings = {
          plugins = {
            MessageClickActions.enabled = true;
            YoutubeAdblock.enabled = true;
            ClearURLs.enabled = true;
            BiggerStreamPreview.enabled = true;
            FavoriteEmoijFirst.enabled = true;
            FixYoutubeEmbeds.enabled = true;
            FriendsSince.enabled = true;
            GameActivityToggle.enabled = true;
            GifPaste.enabled = true;
            ILoveSpam.enabled = true;
            ImageZoom.enabled = true;
            MutualGroupDMs.enabled = true;
            OnePingPerDM.enabled = true;
            petpet.enabled = true;
            ReverseImageSearch.enabled = true;
            RoleColorEverywhere.enabled = true;
            SpotifyControls.enabled = true;
            TypingIndicator.enabled = true;
            TypingTweaks.enabled = true;
            ValidUser.enabled = true;
            ViewIcons.enabled = true;
            VolumeBooster.enabled = true;
            WhoReacted.enabled = true;
            ServerInfo.enabled = true;
            NoOnboardingDelay.enabled = true;
            MentionAvantars.enabled = true;
            CopyFileContents.enabled = true;
            FullSearchContext.enabled = true;
            FullUserInChatbox.enabled = true;

            FakeNitro = {
              enabled = true;
              enableStreamQualityBypass = true;

              # Disable stickers and emoij, can be useful but some servers may ban you for sending one of thoses.
              enableEmoijBypass = false;
              enableStickerBypass = false;
              transformStickers = false;
              transformEmoijs = false;
              transformCompoundSentence = false;
            };

            MessageLogger = {
              enabled = true;
              ignoreSelf = true;
              ignoreBots = true;
              logEdits = false;
            };

            FixSpotifyEmbeds = {
              enabled = true;
              volume = 25;
            };

            AlwaysTrust = {
              enabled = true;
              domain = true;
              file = true;
            };

            BlurNSFW = {
              enabled = true;
              blurAmount = 10;
            };

            NoPendingCount = {
              enabled = true;
              hideFriendRequestsCount = false;
              hideMessageRequestsCount = false;
              hidePremiumOffersCount = true;              
            };

            OpenInApp = {
              enabled = true;
              spotify = true;
              steam = false;
              epic = false;
              tidal = false;
              itunes = false;
            };

            RelationshipNotifier = {
              enabled = true;
              offlineRemovals = true;
              groups = true;
              servers = true;
              friends = true;
              friendRequestCancels = true;
              notices = false;
            };

            ShikiCodeblocks = {
              enabled = true;
              # stheme = "https://github.com/shikijs/textmate-grammars-themes/blob/main/packages/tm-themes/themes/catppuccin-frappe.json";
            };
          };
        };
      };
    };
  };
}
