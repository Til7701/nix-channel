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
    rev = "6a1ba72df95376265525669231a4126a78a88020";
    hash = "sha256-Gfko1Ia4lo9GC4OGY4+AEhJm21wyRQrb54W7lYWKGvc=";
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
