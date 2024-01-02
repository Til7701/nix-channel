{ config, lib, pkgs, ... }:

{
  modules = import ./modules {};
  packages = import ./packages {};
}
