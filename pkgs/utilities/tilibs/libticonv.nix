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
  version = "1.18-unstable-2025-06-25";
  src = fetchFromGitHub {
    owner = "debrouxl";
    repo = "tilibs";
    rev = "70aa26ba81ce8abdb1c6e081b2af1aa679bcc0f1";
    hash = "sha256-V8u5cL0Jj+qew1VSUGenrzSPNL3TXn5WxVZZWp2oHtw=";
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
  ] ++ lib.optional stdenv.hostPlatform.isDarwin "LDFLAGS=-liconv";

  meta = with lib; {
    changelog = "http://lpg.ticalc.org/prj_tilp/news.html";
    description = "This library is part of the TiLP framework";
    homepage = "http://lpg.ticalc.org/prj_tilp/";
    license = licenses.gpl2Plus;
    platforms = with platforms; linux ++ darwin;
  };
})
