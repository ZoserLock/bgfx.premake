-- Create Module
local Module = defineModule("geometryc","bgfx/tools","bgfx", "ConsoleApp");

Module.appTarget = "tools";

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