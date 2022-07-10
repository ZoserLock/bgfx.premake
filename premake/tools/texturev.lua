-- Create Module
local Module = defineModule("texturev","bgfx/tools","bgfx", "ConsoleApp");

Module.MainFunc = function(module)
    module.files = 
    {
        module.dir .."tools/texturev/texturev.cpp",
    };

    module.links =
    {
        {name = "example-common" ,type = "public"},
    };
end

-- Need to be called at last
compileModule(Module);

return Module;