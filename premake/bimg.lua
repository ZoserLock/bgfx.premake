
group("3rdparty");
    include("premake/3rdparty/astc-codec.lua");
    include("premake/3rdparty/astc.lua");
    include("premake/3rdparty/edtaa3.lua");
    include("premake/3rdparty/etc1.lua");
    include("premake/3rdparty/etc2.lua");
    include("premake/3rdparty/iqa.lua");
    include("premake/3rdparty/libsquish.lua");
    include("premake/3rdparty/lodepng.lua");
    include("premake/3rdparty/nvtt.lua");
    include("premake/3rdparty/pvrtc.lua");
    include("premake/3rdparty/tinyexr.lua");
group("");

group("bgfx");

project("bimg");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

    files(
    {
        BIMG_DIR .. "src/**.cpp"
    });

    BIMG_INCLUDE_DIRS = 
    {
        BIMG_DIR.."include",
    }

    includedirs(
    {
        BX_INCLUDE_DIRS,
        BIMG_INCLUDE_DIRS,
        ASTC_CODEC_INCLUDE_DIRS,
        IQA_INCLUDE_DIRS,
        TINYEXR_INCLUDE_DIRS,
    });
  
    defines(
    {
        BX_DEFINE_LIST,
    })

    links(
    { 
        "bx",
        "astc-codec",
        "astc",
        "edtaa3",
        "etc1",
        "etc2",
        "iqa",
        "libsquish",
        "lodepng",
        "nvtt",
        "pvrtc",
        "tinyexr"
    });

       -- ONLY WINDOWS CONFIGURATION
    filter("system:Windows");
        includedirs(
        {
            BX_INCLUDE_DIRS_WIN32
        });
        buildoptions(
        {
            "/Zc:__cplusplus" -- makes __cplusplus report the correct value
        });


   