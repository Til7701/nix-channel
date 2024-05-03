# copied from nixpkgs to use fork
let
  pkgs = import <nixpkgs> { };
in
{ lib ? pkgs.lib
, fetchFromGitHub ? pkgs.fetchFromGitHub
, python3 ? pkgs.python3
}:

python3.pkgs.buildPythonApplication rec {
  pname = "hyfetch";
  version = "1.4.11";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "Til7701";
    repo = "hyfetch";
    rev = "a4c0fdc921ca826c7ea1157bf6eaf95eebc3ddc6";
    hash = "sha256-8/kn7AGnq97uQsbeRBuf9khmZBWcvnom7iANpFieEts=";
  };

  propagatedBuildInputs = with python3.pkgs; [
    typing-extensions
    setuptools
  ];

  # No test available
  doCheck = false;

  pythonImportsCheck = [
    "hyfetch"
  ];

  meta = with lib; {
    description = "neofetch with pride flags <3";
    longDescription = ''
      HyFetch is a command-line system information tool fork of neofetch.
      HyFetch displays information about your system next to your OS logo
      in ASCII representation. The ASCII representation is then colored in
      the pattern of the pride flag of your choice. The main purpose of
      HyFetch is to be used in screenshots to show other users what
      operating system or distribution you are running, what theme or
      icon set you are using, etc.
    '';
    homepage = "https://github.com/Til7701/HyFetch";
    license = licenses.mit;
    mainProgram = "hyfetch";
  };
}
