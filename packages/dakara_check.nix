{ stdenv
, dakara_check-src
, ffmpeg
, ffmpegaacsucks
, meson
, ninja
, pkg-config
}:
stdenv.mkDerivation {
  pname = "dakara_check";
  version = builtins.substring 0 7 dakara_check-src.rev;

  src = dakara_check-src;

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  propagatedBuildInputs = [
    ffmpeg
    ffmpegaacsucks
  ];
}
