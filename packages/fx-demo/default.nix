let
  pkgs = import <nixpkgs> {};
in
{
stdenv ? pkgs.stdenv,
fetchurl ? pkgs.fetchurl,
makeWrapper ? pkgs.makeWrapper,
jre ? pkgs.jre,
makeDesktopItem ? pkgs.makeDesktopItem
}:

stdenv.mkDerivation rec {
  pname = "fx-demo";
  version = "0.0.1";

  src = fetchurl {
    url = "https://github.com/Til7701/javafx-native-image-sample/releases/download/jar/fx-demo_ubuntu-latest.jar";
    hash = "sha256-G+UwJod/PU3hExNlafcbD2DAo74xxKIPXmcSblS87w0=";
  };
  icon = ./icon;

  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
  mkdir -pv $out/share/java $out/bin
  cp ${src} $out/share/java/${pname}.jar

  makeWrapper ${jre}/bin/java $out/bin/fx-demo \
    --add-flags "-jar $out/share/java/${pname}.jar" \
    --set _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on' \
    --set _JAVA_AWT_WM_NONREPARENTING 1

  ln -sv "$desktopItem/share/applications" $out/share/
  mkdir -v $out/share/pixmaps
  ln -sv "$icon/fx-demo.png" $out/share/pixmaps
  '';

  desktopItem = makeDesktopItem {
    name = "PublicDemoName";
    exec = "fx-demo";
    icon = "fx-demo";
    desktopName = "PublicDemoName2";
    genericName = "Demo";
  };
}
