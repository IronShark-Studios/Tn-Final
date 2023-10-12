{
  description = "Configuration for personal travel laptop.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-static.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager.url = "github:nix-community/home-manager";
    home-manager-static.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixos-hardware.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    emacs-community.url = "github:nix-community/emacs-overlay";
    emacs-community.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, sops-nix, emacs-community, ... }@inputs:
   let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ];
    in
    rec {

  overlays = import ./Flake/Overlays { inherit inputs; };
  nixosModules = import ./Flake/Modules/Nixos;
  homeManagerModules = import ./Flake/Modules/Home-Manager;

  nixosConfigurations = {
    thanatos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs outputs; };
      modules = [
        nixos-hardware.nixosModules.lenovo-thinkpad-t430
        sops-nix.nixosModules.sops
        home-manager.nixosModules.home-manager
        ./System/NixOS/configuration.nix
      ];
    };
  };
};
}
