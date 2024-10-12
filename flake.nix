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
          efficient-compression-tool
          ios-safari-remote-debug
          ios-webkit-debug-proxy
          minify
          nil
          nixfmt-rfc-style
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
