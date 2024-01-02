{ stdenv, fetchurl, makeWrapper, jre, makeDesktopItem }:

stdenv.mkDerivation rec {
  pname = "fx-demo-linux";
  version = "0.0.1";

  src = fetchurl {
    url = "https://github.com/Til7701/javafx-native-image-sample/releases/tag/fat-jar/download/fx-demo-linux.jar";
    hash = "sha256-3e6zyXsTYPnzl05WGDSDbb8cNV9bwhrvv2SuvKhinXw=";
  };

  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
  mkdir -pv $out/share/java $out/bin
  cp ${src} $out/share/java/${pname}.jar

  makeWrapper ${jre}/bin/java $out/bin/fx-demo \
    --add-flags "-jar $out/share/java/${pname}.jar" \
    --set _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on' \
    --set _JAVA_AWT_WM_NONREPARENTING 1

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
