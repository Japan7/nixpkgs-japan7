{ self'
, stdenv
, fetchFromGitHub
, meson
, ninja
, pkg-config
, ffmpeg
, ...
}:
stdenv.mkDerivation rec {
  pname = "dakara_check";
  version = "4.0.0";

  src = fetchFromGitHub {
    owner = "Japan7";
    repo = pname;
    rev = version;
    sha256 = "sha256-ea/qDHi2jHHvgjeSUOosMiZB++eihD9xAZobQRPn844=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  propagatedBuildInputs = [
    ffmpeg
    self'.packages.ffmpegaacsucks
  ];
}
