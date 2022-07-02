-- Create Module
local Module = defineModule("texturev","bgfx/tools","bgfx", VALUES.APP_TYPE_CONSOLE_APP);

Module.MainFunc = function(module)
    module.files = 
    {
        module.dir .."tools/texturev/texturev.cpp",
    };

    module.links =
    {
        --{name = "example-common" ,type = "public"},
    };
end

-- Need to be called at last
compileModule(Module);

return Module;