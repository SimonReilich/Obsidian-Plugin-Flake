{
  lib,
  pkgs,
  ...
}:

pkgs.stdenv.mkDerivation rec {
  pname = "obsidian.plugins.git";
  version = "2.36.0";
  repo = "https://github.com/Vinzent03/obsidian-git";

  mainJs = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/main.js";
    sha256 = "sha256-Xk2bQZDZMhPdWylkVSZCI2XgsS4ug+hZKbjlAL9EgBE=";
  };

  manifest = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-vh1/gqPjttVUROqCKbIry388gSjjCQQBK3q8uJGGJos=";
  };

  stylesCss = pkgs.fetchurl {
    url = "${repo}/releases/download/${version}/manifest.json";
    sha256 = "sha256-vh1/gqPjttVUROqCKbIry388gSjjCQQBK3q8uJGGJos=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $stylesCss $out/styles.css
  '';
}
