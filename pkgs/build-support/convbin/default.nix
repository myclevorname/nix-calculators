{ prevPkgs, ce-toolchain, fetchFromGitHub }:
prevPkgs.convbin.overrideAttrs {
  src = ce-toolchain.src + "/tools/convbin";
  name = "convbin";
}
