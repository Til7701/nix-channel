{ config, pkgs, ... }:

let {
  fx-demo = pkgs.callPackage ./fx-demo/fx-demo.nix {};
} pkgs
