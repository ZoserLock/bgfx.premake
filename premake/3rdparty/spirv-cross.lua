-- Create Module
local Module = defineModule("spirv-cross","bgfx/3rdparty","bgfx", VALUES.APP_TYPE_STATIC_LIB);

Module.MainFunc = function(module)
    module.files = 
    {
        module.dir .. "3rdparty/spirv-cross/*.cpp",
        module.dir .. "3rdparty/spirv-cross/*.h",
    };

    module.public.includeDirs =  
    {
        module.dir .. "3rdparty/spirv-cross",
        module.dir .. "3rdparty/spirv-cross/include",
    }

    module.private.defines =
    {
        "SPIRV_CROSS_EXCEPTIONS_TO_ASSERTIONS"
    }
    
    if _TARGET_OS == "windows" then
        module.private.buildOptions =
        {
            "/wd4018",
            "/wd4245",
            "/wd4706",
            "/wd4715",
        }
    end
end

-- Need to be called at last
compileModule(Module);

return Module;