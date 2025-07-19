{
  stdenv,
  lib,
  fetchFromGitHub,
  fetchpatch,
  pkg-config,
  autoreconfHook,
  glib,
  libusb1,
  src,
  version,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "libticables2";
  inherit src version;

  sourceRoot = finalAttrs.src.name + "/libticables/trunk";

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  buildInputs = [
    libusb1
    glib
  ];

  configureFlags = [
    "--enable-libusb10"
  ];

  postInstall = ''
    mkdir -p $out/etc/udev/rules.d
    cp ${./69-libsane.rules} $out/etc/udev/rules.d/69-libsane.rules
  '';

  meta = with lib; {
    changelog = "http://lpg.ticalc.org/prj_tilp/news.html";
    description = "This library is part of the TiLP framework";
    homepage = "http://lpg.ticalc.org/prj_tilp/";
    license = licenses.gpl2Plus;
    platforms = with platforms; linux ++ darwin;
  };
})
