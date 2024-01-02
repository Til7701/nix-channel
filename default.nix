{ config, lib, buildInputs ? [], ... }:

with lib;

mkDerivation {
  name = "til7701";
  buildInputs = buildInputs;

  modules = import ./modules { inherit lib; };
  packages = import ./packages { inherit lib; };
}
