{ config, pkgs, ... }:

{
  fx-demo = pkgs.callPackage ./fx-demo/fx-demo.nix {};
} tilpkgs
