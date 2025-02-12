{
  lib,
  stdenv,
  fetchFromGitHub,
  unzip,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "Amethyst";
  version = "0.21.2";

  src = fetchFromGitHub {
    owner = "ianyh";
    repo = "Amethyst";
    tag = "v${finalAttrs.version}";
    hash = "sha256-qpjLiTXLRAW09g7OQdQRdRnWwKIu4cMyU6IQ8DoIXtU=";
  };

  nativeBuildInputs = [ unzip ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications
    cp -r *.app $out/Applications

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Automatic tiling window manager for macOS à la xmonad";
    homepage = "https://ianyh.com/amethyst/";
    changelog = "https://github.com/ianyh/Amethyst/releases/tag/v${finalAttrs.version}/CHANGELOG.md";
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ethancedwards8 ];
    platforms = lib.platforms.darwin;
  };
})
