{
  inputs = {
    nixpkgs.url = "github:paveloom/nixpkgs/system";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "paveloom.dev-shell";

        nativeBuildInputs = with pkgs; [
          bashInteractive

          nil
          nixfmt-rfc-style

          efficient-compression-tool
          minify

          ios-safari-remote-debug
          ios-webkit-debug-proxy

          shellcheck

          vscode-langservers-extracted

          dockerfile-language-server-nodejs
          hadolint

          yamlfmt
          yamllint
        ];
      };
    };
}
