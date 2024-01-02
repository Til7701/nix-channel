{ stdenv, ... }:

stdenv.mkDerivation {
  name = "til7701";

  modules = import ./modules {};
  packages = import ./packages {};
}
