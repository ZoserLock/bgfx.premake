-- Create Module
local Module = defineModule("fcpp","bgfx/3rdparty","bgfx", VALUES.APP_TYPE_STATIC_LIB);

Module.MainFunc = function(module)
    module.files = 
    {
        module.dir .. "3rdparty/fcpp/*.c",
        module.dir .. "3rdparty/fcpp/*.h",
    };

    module.excludes =
    {
        module.dir .. "3rdparty/fcpp/usecpp.c",
    }

    module.public.includeDirs =  
    {
        module.dir .. "3rdparty/fcpp",
    }
    module.private.defines =
    {
        "NINCLUDE=64",
        "NWORK=65536",
        "NBUFF=65536",
        "OLD_PREPROCESSOR=0",
    }
    
    if _TARGET_OS == "windows" then
        module.private.buildOptions =
        {
            "/W0"
        }
    end
end

-- Need to be called at last
compileModule(Module);

return Module;