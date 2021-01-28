{ lib, stdenv, buildPythonPackage, python3Packages, fetchPypi }:

buildPythonPackage rec {
  pname = "pylink-square";
  version = "0.8.1";

  src = fetchPypi {
   inherit pname version;
   sha256 = "1r062scm1dk58ji2329h2yf3iz18br0scn29d48w58icbzipr6wq";
  };

  doCheck = false;

  propagatedBuildInputs = with python3Packages; [ psutil six future ];

  meta = with lib; {
    description = "Python interface for the SEGGER J-Link";
    homepage = "https://github.com/Square/pylink";
    maintainers = with maintainers; [ dump_stack ];
    license = licenses.asl20;
  };
}
