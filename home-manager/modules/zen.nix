{inputs, pkgs, ...}: {
  imports = [ inputs.zen-browser.homeModules.default ];
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # Zen Internet 
        "{91aa3897-2634-4a8a-9092-279db23a7689}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/zen-internet/latest.xpi";
          installation_mode = "force_installed";
        };
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
        };
      };

      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      Certificates.Install = [ "${../../certs/caddy-root.crt}" ];
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
      DNSOverHTTPS = {
        Enabled = true;
        ProviderURL = "https://dns.quad9.net/dns-query";
        Locked = true;
        Fallback = false;
      };
    };

    profiles.default ={
      mods = [
        "642854b5-88b4-4c40-b256-e035532109df" # Transparent Zen
        "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
      ];

      settings = {
        "browser.tabs.allow_transparent_browser" = true;
        "zen.widget.linux.transparency" = true;
        "zen.view.grey-out-inactive-windows" = false;
        "mod.sameerasw.zen_transparent_sidebar_enabled" = true;
        "mod.sameerasw.zen_transparent_glance_enabled" = true;
        "mod.sameerasw.zen_tab_switch_anim" = true;
        "mod.sameerasw.zen_urlbar_zoom_anim" = true;
        "mod.sameerasw.zen_trackpad_anim" = true;

        "zen.view.compact.hide-tabbar" = true;
        "zen.view.compact.hide-toolbar" = true;
        "zen.view.experimental-no-window-controls" = true;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userContent = ''
        @-moz-document url-prefix("https://127.0.0.1:8888") {
          html, body {
            background: transparent !important;
          }

          /* Transparency */
          :root,
          html.theme-dark,
          html.theme-light {
            --color-base-background: transparent !important;
            --color-base-background-mobile: transparent !important;
            --color-header-background: transparent !important;
            --color-footer-background: transparent !important;
            --color-sidebar-background: transparent !important;
            --color-search-background: #1f1f1f !important;
            --color-result-background: transparent !important;
          }

          /* Darker results cards */
          #answers {
            background: #1f1f1f !important;
            border-radius: 12px !important;
          }

          #answers .answer,
          #answers .answer * {
            background: transparent !important;
          }

          #infoboxes .infobox,
          .infobox {
            background: #1f1f1f !important;
          }

          /* Opaque search bar */
          #q {
            background: #1f1f1f !important;
          }

          /* Image results rounding */
          .result-images img,
          .result-images .image_thumbnail,
          .result-images-source {
            border-radius: 12px !important;
            overflow: hidden;
          }
        }
      '';

      pinsForce = true;
      pins = {
        # Essentials
        "NixOS Packages" = {
          id = "UUID-1";
          url = "https://search.nixos.org/packages";
          isEssential = true;
          position = 101;
        };
        "YouTube" = {
          id = "UUID-2";
          url = "https://www.youtube.com";
          isEssential = true;
          position = 102;
        };
        "Proton Mail" = {
          id = "UUID-3";
          url = "https://mail.proton.me";
          isEssential = true;
          position = 103;
        };
        "GitHub" = {
          id = "UUID-4";
          url = "https://github.com";
          isEssential = true;
          position = 104;
        };
        "Aternos" = {
          id = "UUID-5";
          url = "https://aternos.org";
          isEssential = true;
          position = 105;
        };
        "Claude" = {
          id = "UUID-6";
          url = "https://claude.ai";
          isEssential = true;
          position = 106;
        };

        # Space
        "Cobalt" = {
          id = "6f1c2a4e-3b7d-4c59-9a1e-0d8b5e2f7a31";
          isGroup = true;
          isFolderCollapsed = false;
          position = 200;
        };
        "cobalt (canine)" = {
          id = "a2d94c18-7e03-4f6b-b5c2-1e9f3d6a8b42";
          url = "https://cobalt.canine.tools";
          folderParentId = "6f1c2a4e-3b7d-4c59-9a1e-0d8b5e2f7a31";
          position = 201;
          editedTitle = true;
        };
        "cobalt (meowing)" = {
          id = "c85e1f93-4a2b-4d7c-8e06-7b3a9d1c5f24";
          url = "https://cobalt.meowing.de";
          folderParentId = "6f1c2a4e-3b7d-4c59-9a1e-0d8b5e2f7a31";
          position = 202;
          editedTitle = true;
        };
      };

      search = {
        force = true;
        default = "searxng";
        engines = {
          searxng = {
            name = "SearXNG";
            urls = [{ template = "https://127.0.0.1:8888/search?q={searchTerms}"; }];
            icon = ../../pictures/searxng.svg;
            definedAliases = [ "@sx" ];
          };
          brave = {
            name = "Brave";
            urls = [{ template = "https://search.brave.com/search?q={searchTerms}"; }];
            icon = ../../pictures/brave.svg;
            definedAliases = ["@brave"];
          };
          mynixos = {
            name = "My NixOS";
            urls = [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
            icon = ../../pictures/nixos.svg;
            definedAliases = ["@nix"];
          };
          github = {
            name = "GitHub Search";
            urls = [{ template = "https://github.com/search?q={searchTerms}"; }];
            icon = ../../pictures/github.svg;
            definedAliases = ["@gh"];
          };
        };
      };
    };
  };
}
