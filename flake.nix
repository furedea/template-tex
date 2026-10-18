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
          ls-lint
          nixfmt
          statix
          tex-fmt
          texliveFull
          texlivePackages.chktex
        ];
      };
    };
}
