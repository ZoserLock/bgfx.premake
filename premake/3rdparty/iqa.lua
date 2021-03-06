local Module = defineModule("iqa","bgfx/3rdparty","bimg", "StaticLib");

    Module.MainFunc = function(module)
        module.files = 
        {
            module.dir .. "3rdparty/iqa/source/*.c",
            module.dir .. "3rdparty/iqa/include/*.h"
        };
    
        module.public.includeDirs = 
        {
            module.dir .. "3rdparty/iqa/include",
        }
    end
    
    -- Need to be called at last
    compileModule(Module);
    
    return Module;