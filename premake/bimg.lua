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

-- Create Module with default options
local Module =  defineModule("bimg","bgfx","bimg", "StaticLib",
{
    BX_AMALGAMATED = 0
});

-- Setup module
Module.MainFunc = function(module)
    module.files =
    {
        module.dir .. "src/**.cpp"
    };

    module.public.includeDirs = 
    {
        module.dir .. "include",
    };

    module.links = 
    {
        {name = "bx"         ,type = "public"},
        {name = "astc-codec" ,type = "public"},
        {name = "astc"       ,type = "private"},
        {name = "edtaa3"     ,type = "private"},
        {name = "etc1"       ,type = "private"},
        {name = "etc2"       ,type = "private"},
        {name = "iqa"        ,type = "private"},
        {name = "libsquish"  ,type = "private"},
        {name = "lodepng"    ,type = "private"},
        {name = "nvtt"       ,type = "private"},
        {name = "pvrtc"      ,type = "private"},
        {name = "tinyexr"    ,type = "public"},

    }
end

-- Need to be called at last
compileModule(Module);

return Module;
