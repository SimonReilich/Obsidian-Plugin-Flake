{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.templater";
  version = "2.25.0";
  repo = "https://github.com/SilentVoid13/Templater";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-ail5DorTuz3lvMc4FYjyAJOy2+zB/yfYpdftP867304=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-dZhRiPrItRjuu3kTcKJNrhokdszjkS3kcJd4294BceQ=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-dZhRiPrItRjuu3kTcKJNrhokdszjkS3kcJd4294BceQ=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
