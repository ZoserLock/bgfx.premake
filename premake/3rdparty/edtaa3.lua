project("edtaa3");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BGFX_BIN_DIR .. "3rdparty/");
    objdir(BGFX_OBJ_DIR    .. "3rdparty/");

    files(
    {
        BIMG_DIR .. "3rdparty/edtaa3/*.cpp",
        BIMG_DIR .. "3rdparty/edtaa3/*.h"
    });

    EDTAA3_INCLUDE_DIRS = 
    {
        BIMG_DIR.."3rdparty",
    }

    includedirs(
    {
        EDTAA3_INCLUDE_DIRS
    });
    
    -- BUILD CONFIGURATIONS
    filter("configurations:Debug");
        runtime("Debug");
        symbols("On");

    filter("configurations:Release");
        runtime("Release");
        optimize("On");