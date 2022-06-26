group("bgfx");
project("bx");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BX_DIR .. "lib/");
    objdir(BX_DIR .. "obj/");

    -- If Amalgated is used just include the amalgamated file. Remove the amalgamated file otherwise.
    if BX_AMALGAMATED == 0 then
        files( 
        {  
            BX_DIR .. "src/**.cpp", 
        });
        excludes(
        {
            BX_DIR .. "src/amalgamated.cpp"
        });
    else
        files(
        {
            BX_DIR .. "src/amalgamated.cpp"
        });
    end

    if system == windows then
        printf("Works*************");
    end

    BX_INCLUDE_DIRS = 
    {
        BX_DIR.."include",
        BX_DIR.."3rdparty",
    }

    BX_INCLUDE_DIRS_WIN32 =
    {
        BX_DIR.."include/compat/msvc", 
    }

    includedirs(
    {
        BX_INCLUDE_DIRS
    });
    
    defines(
    {
        BX_DEFINE_LIST,

        "__STDC_LIMIT_MACROS",
        "__STDC_FORMAT_MACROS",
        "__STDC_CONSTANT_MACROS",
    })

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
        links(
        { 
            "psapi"
        });

 -- ONLY OSX CONFIGURATION
    filter("system:Mac");
        systemversion("latest");

-- ONLY LINUX CONFIGURATION
    filter("system:Linux");
        systemversion("latest");


   