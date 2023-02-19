{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      default_pkgs = with pkgs; [
        pdm
        python311
      ];
    in {
      devShells = {
        default = pkgs.mkShell {
          packages = default_pkgs;
        };
        dev = pkgs.mkShell {
          packages =
            default_pkgs
            ++ (with pkgs; [
              shellcheck
              yamlfmt
              yamllint
              alejandra
              ltex-ls
            ]);
        };
      };
    });
}
