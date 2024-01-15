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
  pname = "noel";
  version = "0.1";

  src = fetchurl {
    url = "https://github.com/Til7701/NoEl/releases/download/${version}/noel-linux.jar";
    hash = "sha256-tjEaCO7aQrQwYaq27KbX4xvLq/67XTyMyo//vIi65DY=";
  };
  icon = ./icon;

  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
  mkdir -pv $out/share/java $out/bin
  cp ${src} $out/share/java/${pname}.jar

  makeWrapper ${jre}/bin/java $out/bin/noel \
    --add-flags "-jar $out/share/java/${pname}.jar" \
    --set _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on' \
    --set _JAVA_AWT_WM_NONREPARENTING 1

  ln -sv "$desktopItem/share/applications" $out/share/
  mkdir -v $out/share/pixmaps
  ln -sv "$icon/${pname}.png" $out/share/pixmaps
  '';

  desktopItem = makeDesktopItem {
    name = "NoEl";
    exec = "noel %f";
    icon = "noel";
    desktopName = "NoEl";
  };
}
