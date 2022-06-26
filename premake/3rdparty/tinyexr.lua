project("tinyexr");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

    files(
    {
        BIMG_DIR .."3rdparty/tinyexr/*.c ",
        BIMG_DIR .."3rdparty/tinyexr/*.h",
    });

    TINYEXR_INCLUDE_DIRS = 
    {
        BIMG_DIR.."3rdparty/tinyexr",
        BIMG_DIR.."3rdparty/tinyexr/deps/miniz",
    }

    includedirs(
    {
        TINYEXR_INCLUDE_DIRS
    });