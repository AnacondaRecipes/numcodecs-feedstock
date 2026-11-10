@echo on

set "DISABLE_NUMCODECS_AVX2="
set "PKG_CONFIG_PATH=%LIBRARY_LIB%\pkgconfig"
set "LDFLAGS=%LDFLAGS% liblz4.lib libzstd.lib zlib.lib"

%PYTHON% -m pip install . -vv --no-deps --no-build-isolation ^
    --config-settings=setup-args=-Dsystem_blosc=enabled ^
    --config-settings=setup-args=-Dsystem_zstd=enabled ^
    --config-settings=setup-args=-Dsystem_lz4=enabled ^
    --config-settings=setup-args=-Dsystem_zlib=enabled 
if errorlevel 1 exit 1
