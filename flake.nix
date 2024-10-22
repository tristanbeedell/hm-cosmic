{
  inputs = {
    home-manager-cosmic.url = "github:tristanbeedell/home-manager/cosmic";
  };

  outputs = {home-manager-cosmic, ...}:
  home-manager-cosmic // {

    homeManagerModules.cosmic =
        (import "${home-manager-cosmic}/modules/programs/cosmic/.");
  };
}
