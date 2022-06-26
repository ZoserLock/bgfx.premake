project("iqa");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

    files(
    {
        BIMG_DIR .. "3rdparty/iqa/source/*.c",
        BIMG_DIR .. "3rdparty/iqa/include/*.h"
    });

    IQA_INCLUDE_DIRS = 
    {
        BIMG_DIR.."3rdparty/iqa/include",
    }

    includedirs(
    {
        IQA_INCLUDE_DIRS
    });