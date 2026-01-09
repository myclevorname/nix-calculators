{
  ce-toolchain,
  fetchFromGitHub,
  fetchpatch,
}:
ce-toolchain.overrideAttrs {
  pname = "ce-toolchain-stable";
  version = "14.1";
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
    rev = "444ff89fcf1b6144ee8e179424b1bd3d4eed624b";
    hash = "sha256-oTajT8Wx6tmthEssBEKYXQW9XCCRIZYSsbTmmCMbA4E=";
  };
  postInstall = ''
    rm -r $out/binutils
  '';
}
