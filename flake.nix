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
        homepage = pkgs.callPackage ./homepage.nix { };
        git = pkgs.callPackage ./git.nix { };
        note-linker = pkgs.callPackage ./note-linker.nix { };
        book-search = pkgs.callPackage ./book-search.nix { };
        tag-wrangler = pkgs.callPackage ./tag-wrangler.nix { };
      };

      checks.${system} = self.packages.${system};
    };
}
