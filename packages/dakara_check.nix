{ stdenv
, fetchFromGitHub
, ffmpeg
, meson
, ninja
, pkg-config
, ffmpegaacsucks
, ...
}:
stdenv.mkDerivation rec {
  pname = "dakara_check";
  version = "4.0.1";

  src = fetchFromGitHub {
    owner = "Japan7";
    repo = pname;
    rev = version;
    sha256 = "sha256-VZhDHq64XlIkS9mGvPLEA5i3gm1xPlTYB/uPveOH5Cw=";
  };

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
