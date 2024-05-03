{ pkgs ? import <nixpkgs> { }, ... }:

{
  imports = [
    ./modules
  ];

  fx-demo = pkgs.callPackage ./packages/fx-demo { };
  noel = pkgs.callPackage ./packages/noel { };
  hyfetch = pkgs.callPackage ./packages/hyfetch { };
}
