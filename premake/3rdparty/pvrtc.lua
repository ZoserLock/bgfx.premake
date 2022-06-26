project("pvrtc");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

    files(
    {
        BIMG_DIR .."3rdparty/pvrtc/*.cpp ",
        BIMG_DIR .."3rdparty/pvrtc/*.h",
    });

    PVRTC_INCLUDE_DIRS = 
    {
        BIMG_DIR.."3rdparty/pvrtc",
    }

    includedirs(
    {
        PVRTC_INCLUDE_DIRS
    });