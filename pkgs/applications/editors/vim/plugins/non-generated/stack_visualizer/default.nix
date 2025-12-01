{
  lib,
  vimUtils,
  fetchurl,
}:

vimUtils.buildVimPlugin rec {
  pname = "stack_visualizer";
  version = "0-unstable-2025-12-1";

  src = fetchurl {
    url = "https://raw.githubusercontent.com/504sarwarerror/DOTNVIM/55f9bd503b256ee192ddd0d011015a2fcb43030b/lua/stack_visualizer.lua";
    hash = "sha256-fAx3P/GBa61HyOVjPjEZstY/zEScqXmZwj5wLWGD72c=";
  };

  dontUnpack = true;

  meta = {
    description = "Advanced dynamic stack visualization with Runtime Error Detection";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ethancedwards8 ];
  };
}
