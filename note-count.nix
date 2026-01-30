{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.note-count";
  version = "1.2.4";
  repo = "https://github.com/ozntel/file-explorer-note-count";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-SBO/Ti5uiuQTm1L796jfxPzNG6e06bAsefXx2EzZ8rM=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-tQ2km02kkO0CzFl10qxGSVaqLTmlaNzR+X4fwL7aNG0=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-tQ2km02kkO0CzFl10qxGSVaqLTmlaNzR+X4fwL7aNG0=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
