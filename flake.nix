{
  inputs = {
    home-manager-cosmic.url = "github:tristanbeedell/home-manager/cosmic";
  };

  outputs = {home-manager-cosmic, ...}:
  home-manager-cosmic // {

    homeManagerModules.cosmic = {lib, ...}: {
      imports = [
        (import "${home-manager-cosmic}/modules/programs/cosmic/.")
        # (lib.mkRenamedOptionModule ["programs.cosmic"] [])
      ];
    };

    packages.x86_64-linux.homeConfigurations.example = let
      pkgs = home-manager-cosmic.inputs.nixpkgs.legacyPackages.x86_64-linux;
    in home-manager-cosmic.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [{
        home.stateVersion = "24.05";
        home.username = "example";
        home.homeDirectory = "/example";
      }
      ./example.nix];
    };
  };
}
