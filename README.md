# Til7701 Nix Channel
This repository contains a collection of modules, which can be included into your nix configuration.

> Note: Everything is tested on one single user system. The packages should work regardless, but the modules might not
> work for you.

## Usage
- add the channel: `sudo nix-channel --add https://github.com/Til7701/nix-channel/archive/main.tar.gz til7701`

### On NixOS:
Add the channel to your configuration by doing at least one of the following, depending on what you want to do.
- For modules add the following:
    ``` nix
    imports = [
      <til7701/modules>
    ];
    ```
  and add options for the modules you want to use to your `configuration.nix`. See the [modules](#modules) for more 
  information.
- For packages add the following:
  ``` nix
  tilpkgs = import <til7701/packages> {};
  ```
  and refer to the packages with `tilpkgs.package-name`. So you can install packages globally by adding this to your 
  `configuration.nix` See the [packages](#packages) to see which packages are available.
   ``` nix
  environment.systemPackages = [
    tilpkgs.package-name
  ];
  ```

### Not on NixOS
TODO

## Modules
### fx-demo
[![fx-demo package build state](https://github.com/Til7701/nix-channel/actions/workflows/fx-demo-package-build.yaml/badge.svg)](https://github.com/Til7701/nix-channel/actions/workflows/fx-demo-package-build.yaml)

Provides the package [fx-demo](#fx-demo-1).
- In your `configuration.nix`: 
   ``` nix
   til7701 = {
      fx-demo.enable = true;
   };
   ```

## Packages
### fx-demo
fx-demo is a sample project to show how a JavaFX project can be built into native binaries. It can be found 
[here](https://github.com/Til7701/javafx-native-image-sample).
