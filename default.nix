{ config, pkgs, ... }:

{
  imports = [
    ./modules
  ];

  tilpkgs = ./packages;
}
