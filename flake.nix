{
  description = "";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          commitlint
          deadnix
          lefthook
          nixfmt-rfc-style
          statix
          tex-fmt
          texlive.combined.scheme-full
          texlivePackages.chktex
        ];
      };
    };
}
