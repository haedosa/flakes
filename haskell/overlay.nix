final: prev: {

  cowsay-who = final.writeShellScriptBin "cowsay-who" ''
                 ${final.cowsay}/bin/cowsay "Hi $(${final.coreutils}/bin/whoami)"
               '';

  cowthink-where = final.writeShellScriptBin "cowthink-where" ''
                 ${final.cowsay}/bin/cowthink "Am I at $(${final.nettools}/bin/hostname)?"
               '';

  haskellPackages = prev.haskellPackages.override (old: {
    overrides = final.lib.composeManyExtensions [
      (old.overrides or  (_ : _: {}))
      (hfinal: hprev: {
        haedosa = hfinal.callCabal2nix "haedosa" ./. {};
      })
    ];
  });

}
