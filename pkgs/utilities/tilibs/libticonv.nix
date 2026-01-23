{
  stdenv,
  lib,
  fetchFromGitHub,
  pkg-config,
  autoreconfHook,
  glib,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libticonv";
  version = "1.18-unstable-2026-01-21";
  src = fetchFromGitHub {
    owner = "debrouxl";
    repo = "tilibs";
    rev = "791d2535813fa7ffef8f9feadf110998d4ae57fb";
    hash = "sha256-fVHKG4XywiXbRq4BPRqF3yfFeKACa4rJuU5z8I+WQx4=";
  };

  sourceRoot = finalAttrs.src.name + "/libticonv/trunk";

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  buildInputs = [
    glib
  ];

  configureFlags = [
    "--enable-iconv"
  ]
  ++ lib.optional stdenv.hostPlatform.isDarwin "LDFLAGS=-liconv";

  meta = with lib; {
    changelog = "http://lpg.ticalc.org/prj_tilp/news.html";
    description = "This library is part of the TiLP framework";
    homepage = "http://lpg.ticalc.org/prj_tilp/";
    license = licenses.gpl2Plus;
    platforms = with platforms; linux ++ darwin;
  };
})
