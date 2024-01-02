{ config, stdenv, lib, buildInputs ? [], ... }:

stdenv.mkDerivation {
  name = "til7701";
  inherit buildInputs;
  inherit stenv;

  modules = import ./modules { inherit lib; };
  packages = import ./packages { inherit lib; };
}
