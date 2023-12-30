{ config, pkgs, ... }:

{
  imports = [
    ./modules
  ];

  pkgs = import ./packages;
}
