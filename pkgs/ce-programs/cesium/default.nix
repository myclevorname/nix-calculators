{ buildCEProgram, fetchFromGitHub, ... }:
buildCEProgram {
  name = "cesium";
  src = fetchFromGitHub {
    owner = "mateoconlechuga";
    repo = "cesium";
    rev = "91e1e647f87644d5981e6414bccc69fb898971b6";
    hash = "sha256-+Cn44ukYvKixRw9i3DOCBj+eSmMROm9awqfF4nyE/fM=";
  };
  postInstall = ''
    cp -r creating_icons.md screenshots $out
  '';
  meta = {
    homepage = "https://github.com/mateoconlechuga/cesium";
    description = "A GUI shell for the TI-84+CE";
    license = with lib.licenses; [ bsd3 ];
    maintainers = with lib.maintainers; [ clevor ];
  };
}
