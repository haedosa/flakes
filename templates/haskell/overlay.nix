final: prev: {

  haskellPackages = prev.haskellPackages.override (old: {
    overrides = final.lib.composeManyExtensions [
      (old.overrides or  (_ : _: {}))
      (hfinal: hprev: {
        haedosa = hfinal.callCabal2nix "haedosa" ./. {};
      })
    ];
  });

}
