{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.noel;
  noel = pkgs.callPackage ../packages/noel { };
in
{

  options.til7701.noel = {
    enable = lib.mkEnableOption "noel";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      noel
    ];
  };

}
