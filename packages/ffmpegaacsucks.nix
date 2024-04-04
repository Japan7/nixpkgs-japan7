{ stdenv
, fetchzip
, ffmpeg
, meson
, ninja
, pkg-config
, ...
}:
stdenv.mkDerivation rec {
  pname = "ffmpegaacsucks";
  version = "2.0.0";

  src = fetchzip {
    url = "https://git.odrling.xyz/${pname}/snapshot/ffmpegaacsucks-${version}.tar.gz";
    sha256 = "sha256-ERnCxr562drGfdWomT7zp9NyereBOivtGucYcDM16+k=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  propagatedBuildInputs = [
    ffmpeg
  ];
}
