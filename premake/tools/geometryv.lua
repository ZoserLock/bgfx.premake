-- Create Module with default options
local Module = defineModule("geometryv","bgfx/tools","bgfx", "ConsoleApp");

-- Setup module
Module.MainFunc = function(module)

    module.files =
    {
        module.dir .."tools/geometryv/geometryv.cpp",
    };

    module.links =
    {
        {name = "example-common" , type = "public"},
    };
end

-- Need to be called at last
compileModule(Module);

return Module;