{
  prevPkgs,
  ce-toolchain,
  fetchFromGitHub,
}:
prevPkgs.convimg.overrideAttrs {
  src = ce-toolchain.src + "/tools/convimg";
  name = "convimg";
}
