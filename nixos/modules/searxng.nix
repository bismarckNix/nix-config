{ config, pkgs, ... }:
{
  services.searx = {
    enable = true;
    package = pkgs.searxng;
    environmentFile = config.sops.templates."searx.env".path;

    settings = {
      general = {
        instance_name = "Search";
        debug = false;
        enable_metrics = false;
      };

      server = {
        bind_address = "127.0.0.1";
        port = 8889;
        secret_key = "@SEARXNG_SECRET@";
        limiter = false;
        image_proxy = true;
      };

      search = {
        safe_search = 0;
        autocomplete = "";
        autocomplete_min = 999;
        default_lang = "auto";
        formats = [ "html" ];
        favicon_resolver = "duckduckgo";

        suspended_times = {
          SearxEngineTooManyRequests = 300;
          SearxEngineCaptcha = 3600;
          SearxEngineAccessDenied = 3600;
        };
      };

      ui = {
        default_theme = "simple";
        theme_args.simple_style = "dark";
        center_alignment = true;
        infinite_scroll = false;
        query_in_title = true;
        static_use_hash = true;
      };

      outgoing = {
        request_timeout = 4.0;
        max_request_timeout = 10.0;
        proxies = {
          "all://" = [ "socks5h://127.0.0.1:9050" ];
        };
      };

      engines = [
        { name = "brave";          disabled = false; weight = 2.0; max_page = 2; using_tor_proxy = true; }
        { name = "duckduckgo";     disabled = false; weight = 1.5; }
        { name = "wikipedia";      disabled = false; }
        { name = "mwmbl";          disabled = false; weight = 0.5; }
        { name = "yacy";           disabled = false; weight = 0.5; base_url = "https://yacy.searchlab.eu"; timeout = 10.0; }

        { name = "nixos wiki";        disabled = false; }
        { name = "arch linux wiki";   disabled = false; }
        { name = "github";            disabled = false; }
        { name = "stackoverflow";     disabled = false; }
        { name = "mdn";               disabled = false; }

        { name = "google-cse";        disabled = true; }
      ];

      faviconsSettings = {
        favicons = {
          cfg_schema = 1;
          cache = {
            db_url = "/var/cache/searxng/faviconcache.db";
            LIMIT_TOTAL_BYTES = 536870912;
          };
        };
      };
    };
  };

  # HTTPS
  services.caddy = {
    enable = true;
    virtualHosts."https://127.0.0.1:8888".extraConfig = ''
      tls internal
      reverse_proxy 127.0.0.1:8889
    '';
  };

  # Favicon cache
  systemd.services.searx.serviceConfig.CacheDirectory = "searx";
}
