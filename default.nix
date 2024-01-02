{ config, stdenv, lib, buildInputs ? [], ... }:

stdenv.mkDerivation {
  name = "til7701";
  inherit buildInputs;
  inherit stdenv;

  modules = import ./modules { inherit lib; };
  packages = import ./packages { inherit lib; };
}
