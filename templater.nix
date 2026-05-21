{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.templater";
  version = "2.20.5";
  repo = "https://github.com/SilentVoid13/Templater";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-gcjQuyEsnBJpkC7O7kuqIcg7qF1tjfo0ioBBa8csXuw=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-XfFFHinKveykRd3zRuUfrAqT8Ae/D40QCSTTXXo6A9g=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-XfFFHinKveykRd3zRuUfrAqT8Ae/D40QCSTTXXo6A9g=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
