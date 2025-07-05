{
  buildCEProgram,
  fetchFromGitHub,
  lib,
}:
buildCEProgram {
  pname = "cesium";
  version = "3.7.0-unstable-2024-12-07";
  src = fetchFromGitHub {
    owner = "mateoconlechuga";
    repo = "cesium";
    rev = "d965c32f6eb8611e00e4af5af20a1b96796063bc";
    hash = "sha256-jS3nO+VjJhWYpfq2yVoB6H4o49f5WHgjl3lO3NF8UUg=";
  };
  postInstall = ''
    cp -r creating_icons.md screenshots $out
  '';
  meta = {
    homepage = "https://github.com/mateoconlechuga/cesium";
    description = "A GUI shell for the TI-84+CE";
    license = with lib.licenses; [ bsd3 ];
  };
}
