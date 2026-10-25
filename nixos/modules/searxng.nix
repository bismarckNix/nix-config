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
        port = 8888;
        secret_key = "@SEARXNG_SECRET@";
        limiter = false;
        image_proxy = true;
      };

      search = {
        safe_search = 0;
        autocomplete = "brave";
        autocomplete_min = 2;
        default_lang = "auto";
        formats = [ "html" ];
      };

      ui = {
        default_theme = "simple";
        theme_args.simple_style = "dark";
        center_alignment = true;
        infinite_scroll = true;
        query_in_title = true;
        static_use_hash = true;
      };

      outgoing = {
        request_timeout = 4.0;
        max_request_timeout = 10.0;
      };

      engines = [
        { name = "brave";      disabled = false; weight = 2; }
        { name = "google";     disabled = false; }
        { name = "bing";       disabled = false; }
        { name = "mojeek";     disabled = false; }
        { name = "duckduckgo"; disabled = false;  }
      ];
    };
  };
}
