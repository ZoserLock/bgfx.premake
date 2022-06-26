project("etc1");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

    files(
    {
        BIMG_DIR .. "3rdparty/etc1/*.cpp",
        BIMG_DIR .. "3rdparty/etc1/*.h"
    });

    ETC1_INCLUDE_DIRS = 
    {
        BIMG_DIR.."3rdparty",
    }

    includedirs(
    {
        ETC1_INCLUDE_DIRS
    });