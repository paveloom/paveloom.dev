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

      nativeBuildInputs = with pkgs; [
        bashInteractive
        coreutils
        findutils
        git
        pdm
      ];

      buildImage = {tag}: let
        env = pkgs.buildEnv {
          name = "build-inputs";
          paths = nativeBuildInputs;
        };
      in
        pkgs.runCommand "image.tar.gz" {
          nativeBuildInputs = [pkgs.umoci];
        } ''
          mkdir -p rootfs/{bin,usr/bin}
          xargs tar -c < ${pkgs.writeReferencesToFile env} | tar -xC rootfs/
          ln -s ${pkgs.coreutils}/bin/env rootfs/usr/bin/env
          ln -s ${pkgs.coreutils}/bin/sleep rootfs/bin/sleep
          ln -s ${pkgs.bashInteractive}/bin/bash rootfs/usr/bin/bash
          ln -s ${pkgs.bashInteractive}/bin/sh rootfs/bin/sh

          umoci init --layout image
          umoci new --image image:${tag}
          umoci insert --image image:${tag} rootfs /
          umoci config \
            --config.cmd ${pkgs.bashInteractive}/bin/bash \
            --created "1970-01-01T00:00:01Z" --image image:${tag} \
            --config.env "PATH=${(pkgs.lib.makeBinPath nativeBuildInputs)}" \
            --config.env "SSL_CERT_FILE=${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt" \
            --image image:${tag}

          tar -C image -czf $out .
        '';
    in {
      devShells.default = pkgs.mkShell {
        packages =
          nativeBuildInputs
          ++ (with pkgs; [
            alejandra
            nil
            runc
            shellcheck
          ]);
      };
      packages.image = buildImage {
        tag = "site";
      };
    });
}
