-- Create Module
local Module = defineModule("astc","bgfx/3rdparty","bimg", VALUES.APP_TYPE_STATIC_LIB);

Module.MainFunc = function(module)
    module.files = 
    {
        module.dir .. "3rdparty/astc/*.cpp",
        module.dir .. "3rdparty/astc/*.h"
    };

    module.public.includeDirs = 
    {
        module.dir .. "3rdparty",
    }
end

-- Need to be called at last
compileModule(Module);

return Module;