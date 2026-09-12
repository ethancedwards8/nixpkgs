# `guileImportsCheckHook` {#guileImportsCheckHook}

This hook checks if a guile package can be imported.

It is used like this:

```nix
{
  lib,
  stdenv,
  guileImportsCheckHook,
  # ...
}:

stdenv.mkDerivation (finalAttrs: {
  # ...

  nativeBuildInputs = [ guileImportsCheckHook ];
  guileImportsCheck = [
    "package"
  ];

  # ...
})
```
