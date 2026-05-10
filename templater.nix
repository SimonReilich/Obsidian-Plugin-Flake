{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.templater";
  version = "2.20.3";
  repo = "https://github.com/SilentVoid13/Templater";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-XM/Bz/PATTZxbZ4cQEQADliKMGRsrbQ/ZjnL67JLRFw=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-b1z962aNpjnaCfviav1dBunm6BRCngvFwg/a56APZKM=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-b1z962aNpjnaCfviav1dBunm6BRCngvFwg/a56APZKM=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
