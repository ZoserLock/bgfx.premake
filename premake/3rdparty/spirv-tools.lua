-- Create Module
local Module = defineModule("spirv-tools","bgfx/3rdparty","bgfx", VALUES.APP_TYPE_STATIC_LIB);

Module.MainFunc = function(module)
    module.files = 
    {
        module.dir .. "3rdparty/spirv-tools/source/*.cpp",
        module.dir .. "3rdparty/spirv-tools/source/*.h",
        module.dir .. "3rdparty/spirv-tools/source/opt/*.cpp",
        module.dir .. "3rdparty/spirv-tools/source/opt/*.h",
        module.dir .. "3rdparty/spirv-tools/source/reduce/*.cpp",
        module.dir .. "3rdparty/spirv-tools/source/reduce/*.h",
        module.dir .. "3rdparty/spirv-tools/source/util/*.cpp",
        module.dir .. "3rdparty/spirv-tools/source/util/*.h",
        module.dir .. "3rdparty/spirv-tools/source/val/*.cpp",
        module.dir .. "3rdparty/spirv-tools/source/val/*.h",
    };

    module.public.includeDirs =  
    {
        module.dir .. "3rdparty/spirv-headers/include",
        module.dir .. "3rdparty/spirv-tools",
        module.dir .. "3rdparty/spirv-tools/include",
        module.dir .. "3rdparty/spirv-tools/include/generated",
        module.dir .. "3rdparty/spirv-tools/source",
    }
    
    if _TARGET_OS == "windows" then
        module.private.buildOptions =
        {
            "/wd4127",
            "/wd4389",
            "/wd4702",
            "/wd4706",
        }
    end
end

-- Need to be called at last
compileModule(Module);

return Module;