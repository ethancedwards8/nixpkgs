{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  aiofiles,
  click,
  cloudpickle,
  docstring-parser,
  fsspec,
  connectrpc,
  obstore,
  protobuf,
  pydantic,
  pyyaml,
  rich-click,
  httpx,
  keyring,
  msgpack,
  toml,
  async-lru,
  mashumaro,
  aiolimiter,
  flyteidl2,
  sentry-sdk,
  pyopenssl,
  asyncssh,

}:

buildPythonPackage (finalAttrs: {
  pname = "flyte";
  version = "2.5.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "flyteorg";
    repo = "flyte-sdk";
    tag = "v${finalAttrs.version}";
    hash = "sha256-/pLq1486+WzB3syz1vQ5JBCtsp1WPva/lc8lyNo+61I=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    aiofiles
    click
    cloudpickle
    docstring-parser
    fsspec
    connectrpc
    obstore
    protobuf
    pydantic
    pyyaml
    rich-click
    httpx
    keyring
    msgpack
    toml
    async-lru
    mashumaro
    aiolimiter
    flyteidl2
    sentry-sdk
    pyopenssl
    asyncssh
  ];

  pythonImportsCheck = [ "flyte" ];
})
