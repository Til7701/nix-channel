{ lib, config, pkgs, ... }:

let
  fx-demo = pkgs.callPackage ./fx-demo.nix {};
in tilpkgs
