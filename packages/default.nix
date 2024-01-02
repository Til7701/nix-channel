{ pkgs ? import <nixpkgs> {}, ... }:

{
  fx-demo = pkgs.callPackage ./fx-demo {};
}
