{
  buildDunePackage,
  crowbar,
  eio,
  eio_main,
  logs,
  mdx,
  mirage-crypto-rng-eio,
  ptime,
  tls,
}:

buildDunePackage rec {
  pname = "tls-eio";

  inherit (tls) src meta version;

  minimalOCamlVersion = "5.0";

  # Tests are not compatible with mirage-crypto-rng 1.2.0
  doCheck = false;
  nativeCheckInputs = [
    mdx.bin
  ];
  checkInputs = [
    crowbar
    eio_main
    (mdx.override { inherit logs; })
  ];

  propagatedBuildInputs = [
    ptime
    eio
    mirage-crypto-rng-eio
    tls
  ];
}
