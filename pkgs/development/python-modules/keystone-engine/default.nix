{ lib, stdenv, buildPythonPackage, fetchPypi, keystone }:

buildPythonPackage rec {
  pname = "keystone-engine";
  version = "0.9.2";

  src = fetchPypi {
   inherit pname version;
   sha256 = "1xahdr6bh3dw5swrc2r8kqa8ljhqlb7k2kxv5mrw5rhcmcnzcyig";
  };

  preConfigure = ''
    sed -i "s;libkeystone.so;${keystone}/lib/libkeystone.so;" setup.py
  '';

  meta = with lib; {
    description = "Lightweight multi-platform, multi-architecture assembler framework";
    homepage = "https://www.keystone-engine.org";
    maintainers = with maintainers; [ dump_stack ];
    license = licenses.gpl2Only;
  };
}
