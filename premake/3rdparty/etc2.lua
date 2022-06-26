project("etc2");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

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

    filter("system:Windows");
        includedirs(
        {
            BX_INCLUDE_DIRS_WIN32
        });
        buildoptions(
        {
            "/Zc:__cplusplus" -- makes __cplusplus report the correct value
        });