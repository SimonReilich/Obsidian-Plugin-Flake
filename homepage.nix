{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.homepage";
  version = "4.3.1";
  repo = "https://github.com/mirnovov/obsidian-homepage";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-WcPB8ZooUZICIBQ4PtwXFa9WrZw79enij8G2OrZayJA=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-U93QP9VaKm8INkA5itbljDVPzftR5KODA6qM9G/POb8=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-U93QP9VaKm8INkA5itbljDVPzftR5KODA6qM9G/POb8=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
