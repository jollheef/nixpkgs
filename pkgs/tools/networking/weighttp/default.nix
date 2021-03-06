{ lib, stdenv, fetchgit, python, libev, wafHook }:
stdenv.mkDerivation rec {
  pname = "weighttp";
  version = "0.4";

  src = fetchgit {
    url = "https://git.lighttpd.net/weighttp.git";
    rev = "refs/tags/weighttp-${version}";
    sha256 = "14yjmdx9p8g8c3zlrx5qid8k156lsagfwhl3ny54162nxjf7kzgr";
  };

  nativeBuildInputs = [ wafHook ];
  buildInputs = [ python libev ];

  meta = {
    platforms = lib.platforms.unix;
    homepage = "https://redmine.lighttpd.net/projects/weighttp/wiki";
    description = "A lightweight and simple webserver benchmarking tool";
  };
}
