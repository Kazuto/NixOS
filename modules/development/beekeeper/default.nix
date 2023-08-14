{ options, config, lib, pkgs, ... }:

with lib;
with lib.internal;
let
  cfg = config.shiro.development.beekeeper;
in
{
  options.shiro.development.beekeeper = with types; {
    enable = mkBoolOpt false "Whether or not to install Beekeeper Studio.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ beekeeper-studio ];
  };
}

