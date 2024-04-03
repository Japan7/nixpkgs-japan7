{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, self, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { self', pkgs, ... }:
        let
          attrs = pkgs // { inherit self'; };
        in
        {
          packages = {
            dakara_check = import ./packages/dakara_check.nix attrs;
            ffmpegaacsucks = import ./packages/ffmpegaacsucks.nix attrs;
            syncplay = import ./packages/syncplay.nix attrs;
          };
        };
    };
}
