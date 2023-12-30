{ config, pkgs, ... }:

{
  imports = [
    ./modules
  ];

  tilpkgs = import ./packages;
}
