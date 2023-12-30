{ config, pkgs, ... }:

let
  tilpkgs = import ./packages;
in {
  imports = [
    ./modules
  ];
}
