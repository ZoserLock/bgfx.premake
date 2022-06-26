project("astc");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

    files(
    {
        BIMG_DIR .. "3rdparty/astc/*.cpp",
        BIMG_DIR .. "3rdparty/astc/*.h"
    });

    ASTC_INCLUDE_DIRS = 
    {
        BIMG_DIR.."3rdparty",
    }

    includedirs(
    {
        ASTC_INCLUDE_DIRS
    });