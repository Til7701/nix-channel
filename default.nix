{ pkgs ? import <nixpkgs> {}, ... }:

{
  imports = [
    ./modules
  ];

  packages = import ./packages {};
}
