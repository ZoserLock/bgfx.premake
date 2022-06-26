project("bgfx-vertexlayout");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BGFX_BIN_DIR);
    objdir(BGFX_OBJ_DIR);

    files(
    {
        BGFX_DIR .."src/vertexlayout.cpp ",
    });

    includedirs(
    {
        BX_INCLUDE_DIRS,
        BGFX_INCLUDE_DIRS
    });

    defines(
    {
        BX_DEFINE_LIST,
    });

    filter("system:Windows");
    buildoptions(
    {
        "/Zc:__cplusplus" -- makes __cplusplus report the correct value
    });