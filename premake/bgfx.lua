project("bgfx");
    kind("StaticLib");
    language("C++");

    targetdir(BGFX_BIN_DIR);
    objdir(BGFX_OBJ_DIR);

    -- TODO: BGFX_LIBRARY_TYPE
    staticruntime("On");

    if SYSTEM == "osx" then
        BGFX_AMALGAMATED_SOURCE = "src/amalgamated.mm";
    else
        BGFX_AMALGAMATED_SOURCE = "src/amalgamated.cpp";
    end

    if OPTION_BGFX_AMALGAMATED == 0 then
        files( 
        {  
            BGFX_DIR .. "src/**.cpp", 
            BGFX_DIR .. "src/**.h", 
            BGFX_DIR .. "include/bgfx/*.h", 
            BGFX_DIR .. "include/bgfx/c99/*.h", 
        });
        excludes(
        {
            BGFX_DIR .. BGFX_AMALGAMATED_SOURCE
        });
    else
        files(
        {
            BGFX_DIR .. BGFX_AMALGAMATED_SOURCE
        });
    end

    -- TODO
    -- if BGFX_CONFIG_RENDERER_WEBGPU == 1 then
    -- end

    BGFX_INCLUDE_DIRS = 
    {
        BGFX_DIR .. "3rdparty",
        BGFX_DIR .. "3rdparty/dxsdk/include",
        BGFX_DIR .. "3rdparty/khronos",
        BGFX_DIR .. "include",
    };


    defines(
    {
        BX_DEFINE_LIST,
        BGFX_DEFINE_LIST,

        "__STDC_LIMIT_MACROS",
        "__STDC_FORMAT_MACROS",
        "__STDC_CONSTANT_MACROS",
    });

    includedirs(
    {
        BX_INCLUDE_DIRS,
        BIMG_INCLUDE_DIRS,
        BGFX_INCLUDE_DIRS,
    });

    links(
    { 
        "bx",
        "bimg"
    });

    -- BUILD CONFIGURATIONS
    filter("configurations:Debug");
        runtime("Debug");
        symbols("On");

    filter("configurations:Release");
        runtime("Release");
        optimize("On");

    -- WINDOWS ONLY CONFIGURATION
    filter("system:Windows");
        defines(
        {
            "_CRT_SECURE_NO_WARNINGS"
        });
        buildoptions(
        {
            "/Zc:__cplusplus" -- makes __cplusplus report the correct value
        });

    -- OSX ONLY CONFIGURATION
    filter("system:osx");
    filter();



