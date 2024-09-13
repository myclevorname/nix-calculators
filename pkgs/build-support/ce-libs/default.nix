{ ce-toolchain }:
ce-toolchain.overrideAttrs {
  name = "clibs.8xg";
  postBuild = ''
    make libs $makeFlags
  '';
  installPhase = ''
    cp clibs.8xg $out
  '';
}
