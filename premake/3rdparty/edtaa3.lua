-- Create Module
local Module = defineModule("edtaa3","bgfx/3rdparty","bimg", VALUES.APP_TYPE_STATIC_LIB);

Module.MainFunc = function(module)
    
    module.files = 
    {
        module.dir .. "3rdparty/edtaa3/*.cpp",
        module.dir .. "3rdparty/edtaa3/*.h"
    };

    module.public.includeDirs = 
    {
        module.dir .. "3rdparty",
    }
end

-- Need to be called at last
compileModule(Module);

return Module;