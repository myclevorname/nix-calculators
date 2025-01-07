{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "puzpy";
  version = "0.2.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-eAkUTgdpHaRFmAAQkIBdmesbz4R1kIojY4pAYWBcQBU=";
  };

  build-system = [ setuptools ];

  doCheck = false;
}
