{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  nix-update-script,
  php,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "wavelog";
  version = "2.1.2";

  src = fetchFromGitHub {
    owner = "kohler";
    repo = "peteramati";
    tag = "$";
    hash = "sha256-NXQY9ICU6YVVTnXb19pFqOx4VyTfxzk1RA03RqpEOeA=";
  };

  installPhase = ''
    runHook preInstall
    cp -R . $out
    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Collect and grade programming problem sets with git";
    homepage = "https://github.com/kohler/peteramati";
    license = lib.licenses.mit;
    platforms = php.meta.platforms;
    maintainers = with lib.maintainers; [ ethancedwards8 ];
  };
})
