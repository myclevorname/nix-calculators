{ prevPkgs, ce-toolchain, fetchFromGitHub }:
prevPkgs.convfont.overrideAttrs {
  src = ce-toolchain.src + "/tools/convfont";
  name = "convfont";
}
