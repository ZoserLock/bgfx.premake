# bgfx.premake

This repo contains a way to build bgfx using premake5. 
This was originaly based on the cmake version from here: [https://github.com/bkaradzic/bgfx.cmake](https://github.com/bkaradzic/bgfx.cmake) but then I adapted it to support the build system I use in my other projects, so it relies on a custom lua build system on top of Premake5. 

In any case, it can be used standalone to build libs and tools.

Works only in **Windows** for now.

## How to build
* Run ```scripts/windows-generate-workspace.bat```
* Open ```bgfxlib.sln``` and build projects


