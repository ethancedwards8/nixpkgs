{
  lib,
  makeSetupHook,
  guile,
}:

makeSetupHook {
  name = "guileImportsCheckHook";
  substitutions = {
    gversion = guile.effectiveVersion;
    guile = lib.getExe' guile "guile";
  };
  meta = {
    description = "Import Guile libraries";
    maintainers = with lib.maintainers; [ ethancedwards8 ];
  };
} ./guileImportsCheckHook.sh
