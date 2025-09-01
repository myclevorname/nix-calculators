{
  CEPrograms,
  convbin,
  lib,
  puzpy,
  python3,
  python3Packages,
  stdenv,
}:
{
  description,
  name,
  src,
  title,
  meta ? { },
}:
stdenv.mkDerivation {
  name = name + ".8xv";
  env.packSrc = src;
  src = CEPrograms.crossbun.src;
  buildPhase = ''
    python3 convert.py --title "${title}" --description "${description}" \
      $(find ${src} -name "*.puz") ${name}.8xv
  '';
  installPhase = ''
    cp ${name}.8xv $out
  '';
  nativeBuildInputs = [
    convbin
    (python3.withPackages (
      py: with py; [
        puzpy
        bitstring
        tivars
      ]
    ))
  ];
  inherit meta;
}
