project("geometryc");
    kind("ConsoleApp");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BGFX_BIN_DIR .. "tools/");
    objdir(BGFX_OBJ_DIR    .. "tools/");

    files(
    {
        BGFX_DIR .."tools/geometryc/geometryc.cpp",
    });

    defines(
    {
        BX_DEFINE_LIST,
        "_CRT_SECURE_NO_WARNINGS"
    });

    includedirs(
    {
        BX_INCLUDE_DIRS,
        BGFX_INCLUDE_DIRS
    });

    links(
    {
        "bx",
        "bgfx-vertexlayout",
        "meshoptimizer",
    });
    
    -- BUILD CONFIGURATIONS
    filter("configurations:Debug");
        runtime("Debug");
        symbols("On");

    filter("configurations:Release");
        runtime("Release");
        optimize("On");

    filter("system:Windows");
        buildoptions(
        {
            "/Zc:__cplusplus" -- makes __cplusplus report the correct value
        });