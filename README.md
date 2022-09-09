# bgfx.premake

This repo contains a way to build bgfx using premake5, based on the cmake version from here: [https://github.com/bkaradzic/bgfx.cmake](https://github.com/bkaradzic/bgfx.cmake)

This is used by other of my projects and rely on custom made lua build system on top of premake5. 

In any case it can be used as standalone to build libs and tools.

Works only in Windows for now.

## How to build
* Run ```scripts/windows-generate-workspace.bat```
* Open ```bgfxlib.sln``` and build projects


