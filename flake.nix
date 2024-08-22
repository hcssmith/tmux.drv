{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-lib = {
      url = "github:hcssmith/flake-lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    application-builders = {
      url = "github:hcssmith/application-builders";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    flake-lib,
    application-builders,
    ...
  }:
    flake-lib.lib.mkApp {
      inherit self;
      name = "tmux";
      drv = p:
        application-builders.lib.mkTmux {
          pkgs = p;
          config = {
            prefix = "a";
            colourscheme = "chalk";
          };
        };
    };
}
