project("etc2");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BGFX_BIN_DIR .. "3rdparty/");
    objdir(BGFX_OBJ_DIR    .. "3rdparty/");

    files(
    {
        BIMG_DIR .. "3rdparty/etc2/*.cpp",
        BIMG_DIR .. "3rdparty/etc2/*.h"
    });

    ETC2_INCLUDE_DIRS = 
    {
        BIMG_DIR.."3rdparty",
    }

    includedirs(
    {
        ETC2_INCLUDE_DIRS,
        BX_INCLUDE_DIRS
    });

    links(
    { 
        "bx",
    });

    defines(
    {
        BX_DEFINE_LIST
    })

    -- BUILD CONFIGURATIONS
    filter("configurations:Debug");
        runtime("Debug");
        symbols("On");

    filter("configurations:Release");
        runtime("Release");
        optimize("On");

    -- WINDOWS ONLY CONFIGURATION
    filter("system:Windows");
        buildoptions(
        {
            "/Zc:__cplusplus" -- makes __cplusplus report the correct value
        });