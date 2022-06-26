project("lodepng");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

    files(
    {
        BIMG_DIR .. "3rdparty/lodepng/*.cpp",
        BIMG_DIR .. "3rdparty/lodepng/*.h",
    });

    LODEPNG_INCLUDE_DIRS = 
    {
        BIMG_DIR.."lodepng",
    }

    includedirs(
    {
        LODEPNG_INCLUDE_DIRS
    });