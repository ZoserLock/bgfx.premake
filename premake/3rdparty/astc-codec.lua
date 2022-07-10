-- Create Module
local Module = defineModule("astc-codec","bgfx/3rdparty","bimg", "StaticLib");

Module.MainFunc = function(module)
    module.files = 
    {
        module.dir .. "3rdparty/astc-codec/src/decoder/*.cc",
        module.dir .. "3rdparty/astc-codec/src/decoder/*.h"
    };

    module.public.includeDirs =  
    {
        module.dir .. "3rdparty",
        module.dir .. "3rdparty/astc-codec",
        module.dir .. "3rdparty/astc-codec/include",
    }
end

-- Need to be called at last
compileModule(Module);

return Module;