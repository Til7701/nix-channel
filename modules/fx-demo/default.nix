{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.fx-demo;
  fx-demo = pkgs.callPackage ../../packages/fx-demo {};
in {

  options.til7701.fx-demo = {
    enable = lib.mkEnableOption "fx-demo";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      fx-demo
    ];
  };

}
