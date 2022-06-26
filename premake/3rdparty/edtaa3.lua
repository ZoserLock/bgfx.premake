project("edtaa3");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

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