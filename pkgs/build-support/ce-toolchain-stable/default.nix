{
  ce-toolchain,
  fetchFromGitHub,
  fetchpatch,
}:
ce-toolchain.overrideAttrs {
  pname = "ce-toolchain-stable";
  version = "14.2";
  patches = [
    ./edit-makefiles.patch
    (fetchpatch {
      name = "no-addrsig";
      url = "https://github.com/CE-Programming/toolchain/commit/0c80848d80e32fb098b3831d41a5e3fede3018cb.diff";
      hash = "sha256-vVW2PdCLf51rEktqolAd1RCu3euXRsh9EAD/3ugILdw=";
    })
  ];
  src = fetchFromGitHub {
    owner = "CE-Programming";
    repo = "toolchain";
    fetchSubmodules = true;
    rev = "053daca42f7db05ccd827fe7c926e99a8c35752f";
    hash = "sha256-WW+qSINI3FBYh5cF9bh/+y8jHRSuEPMXSmZl2S4oc1s=";
  };
  postInstall = ''
    rm -r $out/binutils
  '';
}
