{
  stdenv,
  lib,
  fetchFromGitHub,
  pkg-config,
  autoreconfHook,
  glib,
  libarchive,
  tilibs,
  src,
  version,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libtifiles2";
  inherit src version;

  sourceRoot = finalAttrs.src.name + "/libtifiles/trunk";

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  buildInputs = [
    glib
    libarchive
    tilibs.libticonv
  ];

  meta = with lib; {
    changelog = "http://lpg.ticalc.org/prj_tilp/news.html";
    description = "This library is part of the TiLP framework";
    homepage = "http://lpg.ticalc.org/prj_tilp/";
    license = licenses.gpl2Plus;
    platforms = with platforms; linux ++ darwin;
  };
})
