{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "kodama";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "kokic";
    repo = "kodama";
    tag = "v${finalAttrs.version}";
    hash = "sha256-sgqoIavlEmcjRVXyJE5rhYVvVbZdyINra7DARWqmmw0=";
  };
  cargoHash = "sha256-8OPfdjG9ZbwGO/K8dTjH/2zQ6f6I3aBOYuOICMjFqyw=";

  meta = {
    description = "Typst-friendly static Zettelkästen site generator";
    homepage = "https://github.com/kokic/kodama";
    changelog = "https://github.com/kokic/kodama/releases/tag/v${finalAttrs.version}";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ethancedwards8 ];
  };
})
