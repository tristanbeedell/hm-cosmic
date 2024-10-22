{
  inputs = {
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager-cosmic.url = "github:tristanbeedell/home-manager/cosmic";
  };

  outputs = { home-manager-cosmic, home-manager, self, ... }:
    home-manager-cosmic // {
      homeManagerModules.cosmic = { lib, ... }: {
        imports = [
          (import "${home-manager-cosmic}/modules/programs/cosmic/.")
        ]
        /* there's no use adding this to the actual module,
           but for all you early birds, I'll try and keep this updated.
        */
          ++ (map (name:
            lib.mkRenamedOptionModule [ "programs" "cosmic" "comp" name ] [
              "programs"
              "cosmic"
              "comp"
              "settings"
              name
            ]) [
              "active_hint"
              "autotile"
              "autotile_behavior"
              "cursor_follows_focus"
              "descale_xwayland"
              "focus_follows_cursor"
              "focus_follows_cursor_delay"
              "input_default"
              "input_devices"
              "input_touchpad"
              "workspaces"
            ]) ++ [
              (lib.mkRemovedOptionModule [
                "programs"
                "cosmic"
                "comp"
                "xkb_config"
              ] ''
                Cosmic likes overriding this file.
                It will automatically override it with your system config at runtime.
              '')
            ];
      };

      packages.x86_64-linux.homeConfigurations.example =
        let pkgs = home-manager.inputs.nixpkgs.legacyPackages.x86_64-linux;
        in home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              home.stateVersion = "24.05";
              home.username = "example";
              home.homeDirectory = "/example";
            }
            self.homeManagerModules.cosmic
            ./example.nix
          ];
        };
    };
}
