project("libsquish");
    kind("StaticLib");
    language("C++");
    cppdialect("c++17");
    staticruntime("On");

    targetdir(BIMG_DIR .. "lib/");
    objdir(BIMG_DIR .. "obj/");

    files(
    {
        BIMG_DIR .. "3rdparty/libsquish/*.cpp",
        BIMG_DIR .. "3rdparty/libsquish/*.h",
        BIMG_DIR .. "3rdparty/libsquish/*.inl",
    });

    LIBSQUISH_INCLUDE_DIRS = 
    {
        BIMG_DIR.."3rdparty/libsquish",
    }

    includedirs(
    {
        LIBSQUISH_INCLUDE_DIRS
    });