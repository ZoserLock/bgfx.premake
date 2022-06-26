project("bgfx");
    kind("StaticLib");
    language("C++");
    staticruntime("On");

    targetdir("lib/" .. outputDir);
    objdir("obj/" .. outputDir);

    files 
    { 
        "include/**.h", 
        "src/**.cpp",
    }

    includedirs(
    {
        "include",
        "../freetype/include", -- Need to use free type and freetype is used by zen as well
        "../glm/include" -- Needed to have implicit imvec to glm vector conversion
    });

    libdirs(
    {
        "../freetype/lib"
    });

    links(
    {
        "freetype.lib"
    });

-- [WINDOWS]
    filter("system:Windows");
        systemversion("latest");
        
-- [CONFIGURATIONS] --
    filter("configurations:Debug");
        runtime("Debug");
        symbols("On");

    filter("configurations:Release");
        runtime("Release");
        optimize("On");  

    filter("configurations:Dist");
        runtime("Release");
        optimize("On");    