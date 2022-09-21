{ pkgs }: with pkgs;
let

  ghcCharged = haskellPackages.ghcWithHoogle (p: with p; [
    haskell-language-server
    ghcid
  ]);

in
pkgs.mkShell {
  buildInputs = [ cabal-install ghcCharged ];
}
