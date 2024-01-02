{ config, lib, ... }:

{
  modules = import ./modules {};
  packages = import ./packages {};
}
