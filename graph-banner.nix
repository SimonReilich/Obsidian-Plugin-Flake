{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.graph-banner";
  version = "2.3.3";
  repo = "https://github.com/ras0q/obsidian-graph-banner";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-VUUBDpNOVkSGeXHhnbRTQ+HgkbHEjIiubs6Vo7OnpTM=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-Ffm/HsbTnz8HSQMqQ6iZBaTo2ihCouDo36B2CCYKb28=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-Ffm/HsbTnz8HSQMqQ6iZBaTo2ihCouDo36B2CCYKb28=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
