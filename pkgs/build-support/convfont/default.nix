{
  prevPkgs,
  ce-toolchain,
  fetchFromGitHub,
  lib,
}:
prevPkgs.convfont.overrideAttrs {
  src = ce-toolchain.src + "/tools/convfont";
  name = "convfont";
  meta.license = with lib.licenses; [ wtfpl ];
}
