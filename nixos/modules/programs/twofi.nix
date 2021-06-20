{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.programs.twofi;

  settingsFormat = pkgs.formats.yaml {};

in
{
  options = {
    programs.twofi = {

      enable = mkEnableOption "twofi";

      package = mkOption {
        type = types.package;
        default = pkgs.twofi;
        defaultText = literalExample "pkgs.twofi";
        example = literalExample "pkgs.custom-twofi-package";
        description = ''
          The twofi package to use
        '';
      };

      settings = mkOption {
        type = settingsFormat;
        default = { };
        example = literalExample ''
          {
            options = {
             api_key = "mysupersecretkey";
             api_secret = "myothersupersecretkey";
            };
          }
        '';
        description = ''
          Configuration written to
          <filename>/etc/twofi/twofi.yml</filename>. See
          <link xlink:href="https://gitlab.com/kalilinux/packages/twofi/-/blob/kali/master/twofi.yml"/>
          for the default configuration.
        '';
      };

    };
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = [ cfg.package ];

      etc."twofi/twofi.yml".source = mkIf (cfg.settings != { }) {
        source = settingsFormat.generate "twofi.yml" cfg.settings;
      };
    };
  };

}
