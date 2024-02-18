{ options, config, lib, ... }:

with lib;
with lib.my;
let
  cfg = config.modules.services.miniflux;
  port = 6712;
in
{
  options.modules.services.miniflux = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    services = {
      miniflux = {
        enable = false;
        config =
          {
            LISTEN_ADDR = "localhost:${toString port}";
          };
        adminCredentialsFile = "/home/jpesenhofer/.config/dotfiles/secrets/miniflux.conf";
      };
    };

    environment.systemPackages = [ config.services.miniflux.package ];
  };
}
