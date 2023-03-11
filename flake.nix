{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  description = "An agenix extension to facilitate using a Yubikey/master-identity by automating per-host secret rekeying";
  outputs = {
    self,
    nixpkgs,
    ...
  }: {
    nixosModules.agenixRekey = import ./modules/agenix-rekey.nix nixpkgs;
    nixosModules.default = self.nixosModules.agenixRekey;
    defineApps = import ./apps/rekey.nix;
  };
}
