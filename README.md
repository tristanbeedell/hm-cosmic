# Cosmic Home-manager Module

This module is a work-in-progress.
Feel free to use it in your config and provide feedback to
the nixos cosmic matrix room: [#cosmic:nixos.org](https://matrix.to/#/#cosmic:nixos.org)
or to me [@tristan:tristans.cloud](matrix://u/tristan:tristans.cloud)

If you read the flake, you will see that it's just a one liner,
but might be convenient.

## Usage:

Add this repo to your flake inputs

```flake.nix
{
    inputs = {
        home-manager-cosmic.url = "github:tristanbeedell/hm-cosmic";
    };
}
```

and to your home-manager config add the module to your imports

```nix
imports = [
    inputs.home-manager-cosmic.homeManagerModules.cosmic
]
```

alternatively, if you are using the home-manager NixOS Module,
you can add this to `home-manager.sharedModules` ([docs](https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.sharedModules)).

To get the updated docs with the cosmic options included:

```sh
nix build github:tristanbeedell/home-manager/cosmic#docs-manpages
man result/share/man/man5/home-configuration.nix.5
```

The added options are under `programs.cosmic`.

If you want, you could replace home-manager with this flake.
But that might be rather fickle as you won't get upstream's updates
so often.

