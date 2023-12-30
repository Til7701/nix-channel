{ lib, buildInputs ? [] }:

with lib;

{
  modules = import ./modules { inherit buildInputs; };
  packages = import ./packages { inherit buildInputs; };

  fx-demo = packages.fx-demo;
}
