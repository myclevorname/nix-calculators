{
  lib,
  stdenv,
  gcc,
  fetchzip,
  gtk2,
  libticables2,
  pkg-config,
}:
stdenv.mkDerivation {
  pname = "ti80emu";
  version = "0-unstable-2022-11-17";

  src = fetchzip {
    url = "https://www.ticalc.org/pub/unix/ti80emu.zip";
    hash = "sha256-MyrbOBGaBxzY4OTfQghYg14oYEyRFhZ2fV59a4eyy8w=";
    stripRoot = false;
  };

  installPhase = ''
    mkdir -p $out/bin
    cp ti80emu $out/bin
  '';

  nativeBuildInputs = [
    pkg-config
    gcc
  ];
  buildInputs = [
    gtk2
    libticables2
  ];

  meta = {
    license = with lib.licenses; [ cc0 ];
  };
}
