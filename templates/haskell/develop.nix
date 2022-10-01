{ pkgs }: with pkgs; let

  ghcid-bin = haskellPackages.ghcid.bin;

  mk-ghcid-command = { name, target}:
  runCommand name { buildInputs = [ makeWrapper ]; } ''
    makeWrapper "${ghcid-bin}/bin/ghcid" \
                $out/bin/${name} \
                --add-flags \
                "--command='cabal repl ${target}' \
                --test 'Main.main'"
  '';

  ghcid-exe = mk-ghcid-command { name = "ghcid-exe"; target = "exe:haedosa"; };

in mkShell {
  buildInputs =
    (with haskellPackages;

    # build dependencies
    haedosa.env.buildInputs ++
    haedosa.env.nativeBuildInputs ++

    # haskell tools
    [ haskell-language-server
      ghcid
    ]) ++

    # general tools
    [ cabal-install
      ghcid-exe
    ];
}
