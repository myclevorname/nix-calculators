{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "tivars";
  version = "0.9.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-CK80zGDwLgnOI68k9GRlMcCLSBbkzdbG/CRC3mWdPw8=";
  };

  build-system = [ setuptools ];

  doCheck = false;
}
