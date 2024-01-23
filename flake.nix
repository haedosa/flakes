{

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs-23-05";
    };

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs-23-05";
    };

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nixpkgs-22-11.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager-22-11 = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs-22-11";
    };

    nixpkgs-23-05.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager-23-05 = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs-23-05";
    };

    nixpkgs-23-11.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager-23-11 = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-23-11";
    };

  };

  outputs = inputs:
  let
    inherit (inputs.nixpkgs.lib) genAttrs;
    supportedSystems = [ "x86_64-linux" ];
    forAllSystems = genAttrs supportedSystems;
    pkgsFor = nixpkgs_: system: import nixpkgs_ { inherit system; config = { allowUnfree = true; }; };
  in
  {

    pkgs = forAllSystems (system: pkgsFor inputs.nixpkgs system);
    pkgs-stable = forAllSystems (system: pkgsFor inputs.nixpkgs-stable system);
    pkgs-unstable = forAllSystems (system: pkgsFor inputs.nixpkgs-unstable system);
    pkgs-22-11 = forAllSystems (system: pkgsFor inputs.nixpkgs-22-11 system);
    pkgs-23-05 = forAllSystems (system: pkgsFor inputs.nixpkgs-23-05 system);
    pkgs-23-11 = forAllSystems (system: pkgsFor inputs.nixpkgs-23-11 system);

    templates = {

      haskell = {
        path = ./templates/haskell;
        description = "Haskell Project Template";
      };

    };

  };

}
