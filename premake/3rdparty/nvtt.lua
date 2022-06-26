project("nvtt");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

    files(
    {
        BIMG_DIR .."3rdparty/nvtt/bc6h/*.cpp",
        BIMG_DIR .."3rdparty/nvtt/bc6h/*.h",
        BIMG_DIR .."3rdparty/nvtt/bc7/*.cpp",
        BIMG_DIR .."3rdparty/nvtt/bc7/*.h",
        BIMG_DIR .."3rdparty/nvtt/nvcore/*.h",
        BIMG_DIR .."3rdparty/nvtt/nvcore/*.inl",
        BIMG_DIR .."3rdparty/nvtt/nvmath/*.cpp",
        BIMG_DIR .."3rdparty/nvtt/nvmath/*.h",
        BIMG_DIR .."3rdparty/nvtt/*.cpp",
        BIMG_DIR .."3rdparty/nvtt/*.h", 
    });

    NVTT_INCLUDE_DIRS = 
    {
        BIMG_DIR.."3rdparty/nvtt",
    }

    includedirs(
    {
        BX_INCLUDE_DIRS,
        NVTT_INCLUDE_DIRS
    });

    links(
    { 
        "bx",
    });
    
    defines(
    {
        BX_DEFINE_LIST
    })

    filter("system:Windows");
        buildoptions(
        {
            "/Zc:__cplusplus" -- makes __cplusplus report the correct value
        });