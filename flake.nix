{
  description = "nur repo!";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in 
  {
    packages.${system} = {
      # Define your cfait package here
      cfait = pkgs.rustPlatform.buildRustPackage rec {
        pname = "cfait";
        version = "0.4.8";
        src = pkgs.fetchCrate {
          inherit pname version;
          hash = "sha256-CC3zrZPiMVFRvoWC6NElqfOPZyMWGK9jxDm7D4FKoIc="; 
        };
        cargoHash = "sha256-UfKllbRfLi6CqtCDd6b2EHIg0JluU/m5821SjqnSgQA=";
        nativeBuildInputs = [ pkgs.pkg-config ];
        buildInputs = [ pkgs.openssl ];
        doCheck = false;
      };
    };
  };
}
