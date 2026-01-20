{
  buildCrossbunPack,
  fetchurl,
  lib,
}:
buildCrossbunPack {
  name = "MYPACK";
  src = fetchurl {
    name = "cw.puz";
    url = "https://www.xword-muggles.com/download/file.php?mode=view&id=18895";
    hash = "sha256-64zTN7f70vsgv9jaaBHiK9705pV7FfG3suO8ywWdKuw=";
  };
  title = "Test pack";
  description = "Just a test";

  meta = {
    broken = true;
    license = with lib.licenses; [ unfree ]; # Can't find the license
  };
}
