{
  stdenv,
  lib,
  fetchFromGitHub,
  pkg-config,
  autoreconfHook,
  glib,
  tilibs,
  xz,
  bzip2,
  acl,
  libobjc,
  src,
  version,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libticalcs2";
  inherit src version;

  sourceRoot = finalAttrs.src.name + "/libticalcs/trunk";

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  buildInputs =
    [
      glib
      xz
      bzip2
    ]
    ++ (with tilibs; [
      libticonv
      libtifiles2
      libticables2
    ])
    ++ lib.optionals stdenv.hostPlatform.isLinux [
      acl
    ]
    ++ lib.optionals stdenv.hostPlatform.isDarwin [
      libobjc
    ];

  meta = with lib; {
    changelog = "http://lpg.ticalc.org/prj_tilp/news.html";
    description = "This library is part of the TiLP framework";
    homepage = "http://lpg.ticalc.org/prj_tilp/";
    license = licenses.gpl2Plus;
    platforms = with platforms; linux ++ darwin;
  };
})
