{

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs-23-05";
    };

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs-23-05";
    };

    nixpkgs-23-05.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager-23-05 = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs-23-05";
    };

    nixpkgs-22-11.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager-22-11 = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs-22-11";
    };

    nixpkgs-23-11.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager-23-11 = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs-23-11";
    };

  };

  outputs = inputs: {

    templates = {

      haskell = {
        path = ./templates/haskell;
        description = "Haskell Project Template";
      };

    };

  };

}
