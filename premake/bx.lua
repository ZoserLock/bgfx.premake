group("bgfx");
project("bx");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BGFX_BIN_DIR);
    objdir(BGFX_OBJ_DIR);

    -- If Amalgated is used just include the amalgamated file. Remove the amalgamated file otherwise.
    if OPTION_BX_AMALGAMATED == 0 then
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

    BX_INCLUDE_DIRS = 
    {
        BX_DIR .. "include",
        BX_DIR .. "3rdparty",
    };

    if SYSTEM == "windows" then

        local win32Dirs = 
        {
            BX_DIR .. "include/compat/msvc", 
        }

        tableConcat(BX_INCLUDE_DIRS, win32Dirs);
    end

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
    });
    
    -- BUILD CONFIGURATIONS
    filter("configurations:Debug");
        runtime("Debug");
        symbols("On");

    filter("configurations:Release");
        runtime("Release");
        optimize("On");

    -- ONLY WINDOWS CONFIGURATION
    filter("system:Windows");
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


   