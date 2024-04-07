{ stdenv
, ffmpegaacsucks-src
, ffmpeg
, meson
, ninja
, pkg-config
}:
stdenv.mkDerivation {
  pname = "ffmpegaacsucks";
  version = builtins.substring 0 7 ffmpegaacsucks-src.rev;

  src = ffmpegaacsucks-src;

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  propagatedBuildInputs = [
    ffmpeg
  ];
}
