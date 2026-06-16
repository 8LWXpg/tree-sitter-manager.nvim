{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "repro-injection";
  version = "0.1";

  # This SHOULD have bash injection applied (Direct identifier)
  postInstall = ''
    echo "This is a bash command"
  '';

  # This SHOULD NOT have bash injection applied (Dotted attrpath)
  postInstall.subAttribute = "This is just a string, not a bash command";
}
