-- Create Module with default options
local Module = defineModule("geometryc","bgfx/tools","bgfx", VALUES.APP_TYPE_CONSOLE_APP);

-- Setup module
Module.MainFunc = function(module)

    module.files =
    {
        module.dir .."tools/geometryc/geometryc.cpp",
    };

    module.private.defines =
    {
        "_CRT_SECURE_NO_WARNINGS"
    };

    module.links =
    {
        {name = "bx"                ,type = "public"},
        {name = "bgfx-vertexlayout" ,type = "public"},
        {name = "meshoptimizer"     ,type = "public"},
    };
end

-- Need to be called at last
compileModule(Module);

return Module;