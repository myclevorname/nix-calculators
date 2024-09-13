{ convbin, fetchFromGitHub }:
convbin.overrideAttrs {
  src = fetchFromGitHub {
    owner = "mateoconlechuga";
    repo = "convbin";
    fetchSubmodules = true;
    rev = "c142a6c5ebb4e83be29961ccf70080cd169a6091";
    hash = "sha256-vBE+jaQBQREKWYrOOEFLXZt8stAAqGhxvTZhEC5+Xds=";
  };
  version = "unstable";
}
