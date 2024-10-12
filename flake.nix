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
      packages.${system}.site =
        pkgs.runCommandLocal "paveloom.dev"
          {
            src = ./src;
            nativeBuildInputs = with pkgs; [ minify ];
          }
          ''
            cp -r $src out
            chmod +w -R out
            ls -l out
            minify -rav -o . out
            cp -r out $out
          '';
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
        ];
      };
    };
}
