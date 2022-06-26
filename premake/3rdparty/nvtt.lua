project("nvtt");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BGFX_BIN_DIR .. "3rdparty/");
    objdir(BGFX_OBJ_DIR    .. "3rdparty/");

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
    
    -- BUILD CONFIGURATIONS
    filter("configurations:Debug");
        runtime("Debug");
        symbols("On");

    filter("configurations:Release");
        runtime("Release");
        optimize("On");

    -- WINDOWS ONLY CONFIGURATION
    filter("system:Windows");
        buildoptions(
        {
            "/Zc:__cplusplus" -- makes __cplusplus report the correct value
        });
    
