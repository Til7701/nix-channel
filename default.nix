{ config, pkgs ? import <nixpkgs> { }, ... }:

{
  imports =[
    ./modules
  ];

  tilpkgs = ./packages;
}
