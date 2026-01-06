{
  stdenv,
  fetchFromGitHub,
  texinfo,
  perl,
  bison,
  flex,
}:
stdenv.mkDerivation {
  pname = "binutils-z80";
  version = "nightly-unstable-2026-01-06";
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "binutils-gdb";
    rev = "91658d4e49b09a110083beb677b9fa1085c93461";
    hash = "sha256-dQfDyAyg45ET/XfSHfSJ069rvCGoiuUtCCQTys/NMzI=";
  };
  enableParallelBuilding = true;
  configureFlags = [
    "--target=z80-none-elf"
    "--with-zstd=no"
    "--disable-gdb"
    "--disable-sim"
    "--disable-readline"
    "--disable-nls"
  ];
  installTargets = "install-strip";
  nativeBuildInputs = [
    texinfo
    perl
    bison
    flex
  ];
}
