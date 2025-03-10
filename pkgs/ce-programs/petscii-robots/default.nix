{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "petscii-robots";
  version = "0-unstable-2025-02-22";
  src = fetchFromGitHub {
    owner = "nitinseshadri";
    repo = "ce-robots";
    rev = "30f139bf86bb28635c637fbeedd0f3ba6ffd9f64";
    hash = "sha256-du9+/aKMaj7pmPKNd85eQSFC2yn0rhSjoMenfLqOPU8=";
    fetchSubmodules = true;
  };
  meta = {
    description = "Port of Attack of the PETSCII Robots for the TI-84 Plus CE";
    license = with lib.licenses; [ unfree ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
