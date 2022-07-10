-- Create Module
local Module = defineModule("etc2","bgfx/3rdparty","bimg", "StaticLib");

Module.MainFunc = function(module)
    module.files =
    {
        module.dir .. "3rdparty/etc2/*.cpp",
        module.dir .. "3rdparty/etc2/*.h"
    };

    module.public.includeDirs = 
    {
        module.dir .. "3rdparty",
    }

    module.links =
    {
        {name = "bx" ,type = "public"},
    }

end

-- Need to be called at last
compileModule(Module);

return Module;