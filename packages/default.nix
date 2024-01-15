{ pkgs ? import <nixpkgs> {}, ... }:

{
  fx-demo = pkgs.callPackage ./fx-demo {};
  noel = pkgs.callPackage ./noel {};
}
