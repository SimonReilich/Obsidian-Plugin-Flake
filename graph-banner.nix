{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.graph-banner";
  version = "3.0.0";
  repo = "https://github.com/ras0q/obsidian-graph-banner";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-hGQ/xcNjQ/xCo21rhYfti9ssavN9bQo/doy+YbCZos8=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-jMcerCaMPrXBkyxERatWof5tEAAXTsz8g/nTMe8ZZUE=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-jMcerCaMPrXBkyxERatWof5tEAAXTsz8g/nTMe8ZZUE=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
