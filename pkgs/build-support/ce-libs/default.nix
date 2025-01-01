{ ce-toolchain }:
ce-toolchain.overrideAttrs {
  name = "clibs.8xg";
  postBuild = ''
    make libs $makeFlags
  '';
  installPhase = ''
    rm -r $out
    cp clibs.8xg $out
  '';
}
