let
  pkgs = import <nixpkgs> {};
in
{
stdenv ? pkgs.stdenv,
fetchurl ? pkgs.fetchurl,
dpkg ? pkgs.dpkg,
glibc ? pkgs.glibc,
alsaLib ? pkgs.alsaLib,
freetype ? pkgs.freetype,
gcc-unwrapped ? pkgs.gcc-unwrapped,
libX11 ? pkgs.xorg.libX11,
libXtst ? pkgs.xorg.libXtst,
libXrender ? pkgs.xorg.libXrender,
autoPatchelfHook ? pkgs.autoPatchelfHook,
makeDesktopItem ? pkgs.makeDesktopItem
}:

stdenv.mkDerivation rec {
  pname = "fx-demo";
  version = "0.0.1";

  #src = fetchurl {
    #url = "file:/PublicDemoName-linux-image.zip";
   # url = "file:/fx-demo_0.0.1_amd64.deb";
    #url = "https://github.com/Til7701/javafx-native-image-sample/releases/tag/jpackage/download/PublicDemoName-linux-image.zip";
    #hash = "sha256-pA/ygwH5rH6mf2vK+CkFHRd1yspgG/Xeswpuuo2jMzc=";
  #};
  src = ./fx-demo_0.0.1_amd64.deb;

  system = "x86_64-linux";

  nativeBuildInputs = [
    autoPatchelfHook # Automatically setup the loader, and do the magic
    dpkg
  ];

  # Required at running time
  buildInputs = [
    glibc
    gcc-unwrapped
    libX11
    libXtst
    alsaLib
    freetype
    libXrender
  ];

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out
    dpkg -x $src $out
    cp -av $out/opt/fx-demo/* $out
    rm -rf $out/opt

    ln -s "$desktopItem/share/applications" $out/share/
  '';

  desktopItem = makeDesktopItem {
    name = "fx-demo";
    exec = "fx-demo";
    icon = "fx-demo";
    desktopName = "fx-demo";
    genericName = "Demo";
  };
}
