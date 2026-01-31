{
  description = "A flake providing a collection of obsidian plugins";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = {
        book-search = pkgs.callPackage ./book-search.nix { };
        git = pkgs.callPackage ./git.nix { };
        graph-banner = pkgs.callPackage ./graph-banner.nix { };
        homepage = pkgs.callPackage ./homepage.nix { };
        note-linker = pkgs.callPackage ./note-linker.nix { };
        tag-wrangler = pkgs.callPackage ./tag-wrangler.nix { };
        templater = pkgs.callPackage ./templater.nix { };
      };

      checks.${system} = self.packages.${system};
    };
}
