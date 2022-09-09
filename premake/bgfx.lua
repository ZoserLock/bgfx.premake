-- Create Module with default options
local Module = defineModule("bgfx","bgfx","bgfx", "StaticLib");

-- Setup module
Module.MainFunc = function(module)

    if _TARGET_OS == "osx" then
        BGFX_AMALGAMATED_SOURCE = "src/amalgamated.mm";
    else
        BGFX_AMALGAMATED_SOURCE = "src/amalgamated.cpp";
    end

    if module.options.BGFX_AMALGAMATED == 0 then
        module.files = 
        {  
            module.dir .. "src/**.cpp", 
            module.dir .. "src/**.h", 
            module.dir .. "include/bgfx/*.h", 
            module.dir .. "include/bgfx/c99/*.h", 
        };
        module.excludes =
        {
            module.dir .. BGFX_AMALGAMATED_SOURCE
        };
    else
        module.files = 
        {
            module.dir .. BGFX_AMALGAMATED_SOURCE
        };
    end

    -- TODO
    -- if BGFX_CONFIG_RENDERER_WEBGPU == 1 then
    -- end

    module.public.includeDirs = 
    {
        module.dir .. "3rdparty",
        module.dir .. "3rdparty/dxsdk/include",
        module.dir .. "3rdparty/khronos",
        module.dir .. "include",
    };

    module.public.defines =
    {
        "BGFX_CONFIG_MULTITHREADED=" .. module.options.BGFX_CONFIG_MULTITHREADED,
    };

    module.private.defines =
    {
        "__STDC_LIMIT_MACROS",
        "__STDC_FORMAT_MACROS",
        "__STDC_CONSTANT_MACROS",
    }

    module.links =
    {
        {name = "bx"   ,type = "public"},
        {name = "bimg" ,type = "public"},
    }

    if _TARGET_OS == "windows" then
        local winDefines =
        {
            "_CRT_SECURE_NO_WARNINGS"
        }

        tableConcat(module.public.defines, winDefines);
    end

end

-- Need to be called at last
compileModule(Module);

return Module;


