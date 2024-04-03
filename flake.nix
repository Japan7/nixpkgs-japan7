{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, self, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { pkgs, system, ... }: {
        packages = rec {
          ffmpegaacsucks = with pkgs; stdenv.mkDerivation rec {
            pname = "ffmpegaacsucks";
            version = "2.0.0";
            src = fetchzip {
              url = "https://git.odrling.xyz/${pname}/snapshot/ffmpegaacsucks-${version}.tar.gz";
              sha256 = "sha256-ERnCxr562drGfdWomT7zp9NyereBOivtGucYcDM16+k=";
            };
            nativeBuildInputs = [ meson ninja pkg-config ];
            propagatedBuildInputs = [ ffmpeg ];
          };

          dakara_check = with pkgs; stdenv.mkDerivation rec {
            pname = "dakara_check";
            version = "4.0.0";
            src = fetchFromGitHub {
              owner = "Japan7";
              repo = pname;
              rev = version;
              sha256 = "sha256-ea/qDHi2jHHvgjeSUOosMiZB++eihD9xAZobQRPn844=";
            };
            nativeBuildInputs = [ meson ninja pkg-config ];
            propagatedBuildInputs = [ ffmpeg ffmpegaacsucks ];
          };
        };
      };
    };
}
