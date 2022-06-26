project("astc-codec");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BGFX_BIN_DIR .. "3rdparty/");
    objdir(BGFX_OBJ_DIR    .. "3rdparty/");

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

    -- BUILD CONFIGURATIONS
    filter("configurations:Debug");
        runtime("Debug");
        symbols("On");

    filter("configurations:Release");
        runtime("Release");
        optimize("On");