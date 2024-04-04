{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, self, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { pkgs, ... }: {
        packages = rec {
          dakara_check = pkgs.callPackage ./packages/dakara_check.nix { inherit ffmpegaacsucks; };
          ffmpegaacsucks = pkgs.callPackage ./packages/ffmpegaacsucks.nix { };
          syncplay = pkgs.callPackage ./packages/syncplay.nix { };
        };
      };
    };
}
