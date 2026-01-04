{
  description = "A flake providing a collection of obsidian plugins";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {

      packages.x86_64-linux.homepage = pkgs.callPackage ./homepage.nix { };

      packages.x86_64-linux.git = pkgs.callPackage ./git.nix { };

      packages.x86_64-linux.note-linker = pkgs.callPackage ./note-linker.nix { };

      packages.x86_64-linux.book-search = pkgs.callPackage ./book-search.nix { };

      packages.x86_64-linux.tag-wrangler = pkgs.callPackage ./tag-wrangler.nix { };

    };
}
