{
  description = "A very basic flake";

  inputs = {
    flake-lib.url = "github:hcssmith/flake-lib";
    application-builders.url = "github:hcssmith/application-builders";
  };

  outputs = {
    self,
    flake-lib,
    application-builders,
  }:
    flake-lib.lib.mkApp {
      inherit self;
      name = "tmux";
      drv = p:
        application-builders.lib.mkTmux rec {
          pkgs = p;
          config = {
            prefix = "a";
            colourscheme = "chalk";
            plugins = with pkgs; [
            ];
          };
        };
    };
}
