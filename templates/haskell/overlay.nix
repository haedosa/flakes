final: prev: {

  haskellPackages = prev.haskellPackages.override (old: {
    overrides = final.lib.composeManyExtensions [
      (old.overrides or  (_ : _: {}))
      (hfinal: hprev: {
        haedosa-lib = hfinal.callCabal2nix "haedosa-lib" ./haedosa-lib {};
        haedosa-app = hfinal.callCabal2nix "haedosa-app" ./haedosa-app {};
      })
    ];
  });

}
