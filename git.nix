{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.git";
  version = "2.39.0";
  repo = "https://github.com/Vinzent03/obsidian-git";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-1adANs8XwaApV8HzP1nkfPOvg1JWQcQ3TKH6CdlfPrQ=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-JwQQ7dbmT1HZdDQ8binsg5lQL24FeuXWJk0lmxBPYlw=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-JwQQ7dbmT1HZdDQ8binsg5lQL24FeuXWJk0lmxBPYlw=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
