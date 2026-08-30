{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.tag-wrangler";
  version = "0.6.5";
  repo = "https://github.com/pjeby/tag-wrangler";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-85C/E1E1AzyyuEhUOK9C77mT3dkyVawINgFuES7pqyA=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-JxqT5gWwn2iftLBa8fc/UIDgh2/CR2NeT+niwtiK2pY=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-JxqT5gWwn2iftLBa8fc/UIDgh2/CR2NeT+niwtiK2pY=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
