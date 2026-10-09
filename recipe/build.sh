#!/bin/bash
set -ex

export DISABLE_NUMCODECS_AVX2=""
if [[ "${target_platform}" == osx-arm64 ]]; then
    export DISABLE_NUMCODECS_SSE2=""
fi

$PYTHON -m pip install . -vv --no-deps --no-build-isolation \
    --config-settings=setup-args=-Dsystem_blosc=enabled \
    --config-settings=setup-args=-Dsystem_zstd=enabled \
    --config-settings=setup-args=-Dsystem_lz4=enabled
