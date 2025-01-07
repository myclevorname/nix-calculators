{ buildTIBoyCEROM, fetchurl }:
buildTIBoyCEROM {
  name = "tiboyce-converter-test";
  namePrefix = "Gbt";
  src = fetchurl {
    url = "https://hh3.gbdev.io/static/database-gb/entries/dots/dots.gbc";
    hash = "sha256-e42GKY9x2zS7tgUmj5HV319hw8DAWSD44YFyrk74/wc=";
  };
}
