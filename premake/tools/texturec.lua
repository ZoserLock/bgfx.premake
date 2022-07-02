-- Create Module
local Module = defineModule("texturec","bgfx/tools","bimg", VALUES.APP_TYPE_CONSOLE_APP);

Module.MainFunc = function(module)
    module.files = 
    {
        module.dir .."tools/texturec/texturec.cpp"
    };

    module.links =
    {
        {name = "bimg", type = "public"},
    }
end

-- Need to be called at last
compileModule(Module);

return Module;