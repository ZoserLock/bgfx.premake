


include("premake/3rdparty/fcpp.lua");
include("premake/3rdparty/glsl-optimizer.lua");
include("premake/3rdparty/glslang.lua");
include("premake/3rdparty/spirv-cross.lua");
include("premake/3rdparty/spirv-tools.lua");
include("premake/3rdparty/webgpu.lua");


-- Create Module
local Module = defineModule("shaderc","bgfx/tools","bgfx", VALUES.APP_TYPE_CONSOLE_APP);

Module.MainFunc = function(module)
    module.files = 
    {
        module.dir .."tools/shaderc/shaderc.cpp",
        module.dir .."tools/shaderc/shaderc.h",
        module.dir .."tools/shaderc/shaderc_glsl.cpp", 
        module.dir .."tools/shaderc/shaderc_hlsl.cpp", 
        module.dir .."tools/shaderc/shaderc_pssl.cpp", 
        module.dir .."tools/shaderc/shaderc_spirv.cpp", 
        module.dir .."tools/shaderc/shaderc_metal.cpp",
    };

    module.private.defines =
    {
        "_CRT_SECURE_NO_WARNINGS",
    }

    module.links =
    {
        {name = "bx"                ,type = "public"},
        {name = "bimg"              ,type = "public"},
        {name = "bgfx-vertexlayout" ,type = "public"},
        {name = "bgfx-shader"       ,type = "public"},
        {name = "fcpp"              ,type = "public"},
        {name = "glsl-optimizer"    ,type = "public"},
        {name = "glslang"           ,type = "public"},
        {name = "spirv-cross"       ,type = "public"},
        {name = "spirv-tools"       ,type = "public"},
        {name = "webgpu"            ,type = "public"},
    }
end

-- Need to be called at last
compileModule(Module);

return Module;