# Til7701 Nix Channel
This repository contains a collection of modules, which can be included into your nix configuration.

## Usage
1. add the channel: `sudo nix-channel --add https://github.com/Til7701/nix-channel/archive/main.tar.gz til7701`

### On NixOS:
2. import the channel to your configuration: 
    ``` nix
    imports = [
      <til7701>
    ];
    ```
3. add options for the modules you want to use to your `configuration.nix`

### Not on NixOS (NOT TESTED YET)
You might want ot use a nix-shell. Better options might be available.
2. import the channel to your `shell.nix`:
    ``` nix
    imports = [
      <til7701>
    ];
    ```
3. add options for the modules you want to use to your shell config.

## Modules
### fx-demo

