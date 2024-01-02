{ pkgs ? import <nixpkgs> {}, ... }:

{
  modules = import ./modules {};
  packages = import ./packages {};
}
