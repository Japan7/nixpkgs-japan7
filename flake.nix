{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    dakara_check-src = {
      url = "github:Japan7/dakara_check";
      flake = false;
    };
    ffmpegaacsucks-src = {
      url = "git+https://git.odrling.xyz/ffmpegaacsucks";
      flake = false;
    };
    syncplay-src = {
      url = "github:odrling/syncplay";
      flake = false;
    };
  };

  outputs =
    { flake-parts
    , dakara_check-src
    , ffmpegaacsucks-src
    , syncplay-src
    , ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { self', pkgs, ... }: {
        packages = rec {
          dakara_check = pkgs.callPackage ./packages/dakara_check.nix { inherit dakara_check-src ffmpegaacsucks; };
          ffmpegaacsucks = pkgs.callPackage ./packages/ffmpegaacsucks.nix { inherit ffmpegaacsucks-src; };
          syncplay = pkgs.callPackage ./packages/syncplay.nix { inherit syncplay-src; };
        };

        devShells = {
          karaberus = pkgs.mkShell {
            packages = with pkgs; [
              go
              go-tools
              gopls
              pkg-config
              self'.packages.dakara_check
            ];
          };
          nanachan = pkgs.mkShell {
            packages = with pkgs; [
              ffmpeg
              libopus
              poetry
              python312
              redis
            ];
          };
          nanapi = pkgs.mkShell {
            packages = with pkgs; [
              edgedb
              meilisearch
              poetry
              python312
            ];
          };
        };
      };
    };
}
