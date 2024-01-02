{ pkgs ? import <nixpkgs> {}, ... }:

{
  imports = [
    ./modules
    ./packages
  ];
}
