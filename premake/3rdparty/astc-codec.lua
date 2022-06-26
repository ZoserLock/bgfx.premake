project("astc-codec");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

    files(
    {
        BIMG_DIR .. "3rdparty/astc-codec/src/decoder/*.cc",
        BIMG_DIR .. "3rdparty/astc-codec/src/decoder/*.h"
    });

    ASTC_CODEC_INCLUDE_DIRS = 
    {
        BIMG_DIR.."3rdparty",
        BIMG_DIR.."3rdparty/astc-codec",
        BIMG_DIR.."3rdparty/astc-codec/include",
    }

    includedirs(
    {
        ASTC_CODEC_INCLUDE_DIRS
    });