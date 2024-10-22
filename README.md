# Cosmic Home-manager Module

This module is a work-in-progress. Expect breaking changes.

Having said that, feel free to use it in your config and provide feedback to
the nixos cosmic matrix room: [#cosmic:nixos.org](https://matrix.to/#/#cosmic:nixos.org)
or to me [@tristan:tristans.cloud](matrix://u/tristan:tristans.cloud).

## Usage:

Add this repo to your flake inputs

```flake.nix
{
    inputs = {
        home-manager-cosmic.url = "github:tristanbeedell/hm-cosmic";
    };
}
```

and to your home-manager config add the module to your modules

```nix
modules = [
    inputs.home-manager-cosmic.homeManagerModules.cosmic
]
```

or imports.

Alternatively, if you are using the home-manager NixOS Module,
you can add this to `home-manager.sharedModules` ([docs](https://nix-community.github.io/home-manager/nixos-options.xhtml#nixos-opt-home-manager.sharedModules)).

To get the updated docs with the cosmic options included:

```sh
nix build github:tristanbeedell/hm-cosmic#docs-manpages
man result/share/man/man5/home-configuration.nix.5
```

The added options are under `programs.cosmic`.

Also, see [example.nix](./example.nix)

